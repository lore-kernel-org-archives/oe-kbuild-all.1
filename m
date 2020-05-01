Content-Type: multipart/mixed; boundary="===============2454759470976531498=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hare-scsi-devel:reserved-tags.v3 36/41] drivers/scsi/hisi_sas/hisi_sas_main.c:1196:36: sparse: sparse: incorrect type in argument 2 (different base types)
Date: Fri, 01 May 2020 15:49:09 +0800
Message-ID: <202005011500.X3kKXnBH%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2454759470976531498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 reserved-tags.v3
head:   7e846b812c89291eaaf342f3a37944fefc17473b
commit: 7f3f003ba62f8d93a1eec0cd56877a15c7989740 [36/41] scsi: libsas,hisi_=
sas,mvsas,pm8001: Allocate Scsi_cmd for slow task
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 7f3f003ba62f8d93a1eec0cd56877a15c7989740
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/scsi/hisi_sas/hisi_sas_main.c:1196:36: sparse: sparse: incorrect=
 type in argument 2 (different base types) @@    expected struct scsi_lun *=
 @@    got truct scsi_lun * @@
>> drivers/scsi/hisi_sas/hisi_sas_main.c:1196:36: sparse:    expected struc=
t scsi_lun *
>> drivers/scsi/hisi_sas/hisi_sas_main.c:1196:36: sparse:    got struct scs=
ilun *
>> drivers/scsi/hisi_sas/hisi_sas_main.c:1198:56: sparse: sparse: invalid i=
nitializer
   drivers/scsi/hisi_sas/hisi_sas_main.c:1200:25: sparse: sparse: using mem=
ber 'scsi_lun' in incomplete struct scsilun

vim +1196 drivers/scsi/hisi_sas/hisi_sas_main.c

  1178	=

  1179	#define TASK_TIMEOUT 20
  1180	#define TASK_RETRY 3
  1181	#define INTERNAL_ABORT_TIMEOUT 6
  1182	static int hisi_sas_exec_internal_tmf_task(struct domain_device *dev=
ice,
  1183						   void *parameter, u32 para_len,
  1184						   struct hisi_sas_tmf_task *tmf)
  1185	{
  1186		struct hisi_sas_device *sas_dev =3D device->lldd_dev;
  1187		struct hisi_hba *hisi_hba =3D sas_dev->hisi_hba;
  1188		struct sas_ha_struct *sha =3D &hisi_hba->sha;
  1189		struct device *dev =3D hisi_hba->dev;
  1190		struct sas_task *task;
  1191		int res, retry;
  1192	=

  1193		for (retry =3D 0; retry < TASK_RETRY; retry++) {
  1194			struct scsilun lun;
  1195	=

> 1196			int_to_scsilun(0, &lun);
  1197			if (!dev_is_sata) {
> 1198				struct sas_ssp_task ssp_task =3D parameter;
  1199	=

  1200				memcpy(lun.scsi_lun, ssp_task.LUN, 8);
  1201			}
  1202			task =3D sas_alloc_slow_task(sha, device, &lun, GFP_KERNEL);
  1203			if (!task)
  1204				return -ENOMEM;
  1205	=

  1206			task->dev =3D device;
  1207			task->task_proto =3D device->tproto;
  1208	=

  1209			if (dev_is_sata(device)) {
  1210				task->ata_task.device_control_reg_update =3D 1;
  1211				memcpy(&task->ata_task.fis, parameter, para_len);
  1212			} else {
  1213				memcpy(&task->ssp_task, parameter, para_len);
  1214			}
  1215			task->task_done =3D hisi_sas_task_done;
  1216	=

  1217			task->slow_task->timer.function =3D hisi_sas_tmf_timedout;
  1218			task->slow_task->timer.expires =3D jiffies + TASK_TIMEOUT * HZ;
  1219			add_timer(&task->slow_task->timer);
  1220	=

  1221			res =3D hisi_sas_task_exec(task, GFP_KERNEL, 1, tmf);
  1222	=

  1223			if (res) {
  1224				del_timer(&task->slow_task->timer);
  1225				dev_err(dev, "abort tmf: executing internal task failed: %d\n",
  1226					res);
  1227				goto ex_err;
  1228			}
  1229	=

  1230			wait_for_completion(&task->slow_task->completion);
  1231			res =3D TMF_RESP_FUNC_FAILED;
  1232			/* Even TMF timed out, return direct. */
  1233			if ((task->task_state_flags & SAS_TASK_STATE_ABORTED)) {
  1234				if (!(task->task_state_flags & SAS_TASK_STATE_DONE)) {
  1235					struct hisi_sas_slot *slot =3D task->lldd_task;
  1236	=

  1237					dev_err(dev, "abort tmf: TMF task timeout and not done\n");
  1238					if (slot) {
  1239						struct hisi_sas_cq *cq =3D
  1240						       &hisi_hba->cq[slot->dlvry_queue];
  1241						/*
  1242						 * sync irq to avoid free'ing task
  1243						 * before using task in IO completion
  1244						 */
  1245						synchronize_irq(cq->irq_no);
  1246						slot->task =3D NULL;
  1247					}
  1248	=

  1249					goto ex_err;
  1250				} else
  1251					dev_err(dev, "abort tmf: TMF task timeout\n");
  1252			}
  1253	=

  1254			if (task->task_status.resp =3D=3D SAS_TASK_COMPLETE &&
  1255			     task->task_status.stat =3D=3D TMF_RESP_FUNC_COMPLETE) {
  1256				res =3D TMF_RESP_FUNC_COMPLETE;
  1257				break;
  1258			}
  1259	=

  1260			if (task->task_status.resp =3D=3D SAS_TASK_COMPLETE &&
  1261				task->task_status.stat =3D=3D TMF_RESP_FUNC_SUCC) {
  1262				res =3D TMF_RESP_FUNC_SUCC;
  1263				break;
  1264			}
  1265	=

  1266			if (task->task_status.resp =3D=3D SAS_TASK_COMPLETE &&
  1267			      task->task_status.stat =3D=3D SAS_DATA_UNDERRUN) {
  1268				/* no error, but return the number of bytes of
  1269				 * underrun
  1270				 */
  1271				dev_warn(dev, "abort tmf: task to dev %016llx resp: 0x%x sts 0x%x=
 underrun\n",
  1272					 SAS_ADDR(device->sas_addr),
  1273					 task->task_status.resp,
  1274					 task->task_status.stat);
  1275				res =3D task->task_status.residual;
  1276				break;
  1277			}
  1278	=

  1279			if (task->task_status.resp =3D=3D SAS_TASK_COMPLETE &&
  1280				task->task_status.stat =3D=3D SAS_DATA_OVERRUN) {
  1281				dev_warn(dev, "abort tmf: blocked task error\n");
  1282				res =3D -EMSGSIZE;
  1283				break;
  1284			}
  1285	=

  1286			if (task->task_status.resp =3D=3D SAS_TASK_COMPLETE &&
  1287			    task->task_status.stat =3D=3D SAS_OPEN_REJECT) {
  1288				dev_warn(dev, "abort tmf: open reject failed\n");
  1289				res =3D -EIO;
  1290			} else {
  1291				dev_warn(dev, "abort tmf: task to dev %016llx resp: 0x%x status 0=
x%x\n",
  1292					 SAS_ADDR(device->sas_addr),
  1293					 task->task_status.resp,
  1294					 task->task_status.stat);
  1295			}
  1296			sas_free_task(task);
  1297			task =3D NULL;
  1298		}
  1299	ex_err:
  1300		if (retry =3D=3D TASK_RETRY)
  1301			dev_warn(dev, "abort tmf: executing internal task failed!\n");
  1302		sas_free_task(task);
  1303		return res;
  1304	}
  1305	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2454759470976531498==--

