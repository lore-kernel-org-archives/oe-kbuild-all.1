Content-Type: multipart/mixed; boundary="===============0265230894910744795=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1377:21: sparse: sparse: incorrect type in assignment (different base types)
Date: Wed, 27 May 2020 20:26:52 +0800
Message-ID: <202005272049.h1SLU8w7%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0265230894910744795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   444fc5cde64330661bf59944c43844e7d4c2ccd8
commit: 804c5702fc583afbdb6860f79e9d4058570ccc43 qed: Use dmae to write to =
widebus registers in fw_funcs
date:   4 months ago
config: ia64-randconfig-s032-20200527 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-240-gf0fe1cd9-dirty
        git checkout 804c5702fc583afbdb6860f79e9d4058570ccc43
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dia64 CF=3D'-fdiagnostic-prefix -D__CHECK_EN=
DIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:545:17: sparse:    r=
ight side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:545:17: sparse: spar=
se: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:545:17: sparse:    l=
eft side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:545:17: sparse:    r=
ight side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1343:9: sparse: spar=
se: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1343:9: sparse:    l=
eft side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1343:9: sparse:    r=
ight side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1343:9: sparse: spar=
se: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1343:9: sparse:    l=
eft side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1343:9: sparse:    r=
ight side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1344:9: sparse: spar=
se: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1344:9: sparse:    l=
eft side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1344:9: sparse:    r=
ight side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1344:9: sparse: spar=
se: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1344:9: sparse:    l=
eft side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1344:9: sparse:    r=
ight side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1347:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1347:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1347:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1347:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1347:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1347:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1348:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1348:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1348:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1348:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1348:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1348:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1349:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1349:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1349:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1349:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1349:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1349:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1350:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1350:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1350:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1350:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1350:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1350:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1351:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1351:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1351:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1351:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1351:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1351:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1352:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1352:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1352:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1352:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1352:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1352:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1354:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1354:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1354:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1354:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1354:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1354:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1355:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1355:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1355:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1355:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1355:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1355:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1356:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1356:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1356:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1356:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1356:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1356:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1358:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1358:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1358:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1358:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1358:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1358:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1359:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1359:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1359:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1359:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1359:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1359:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1361:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1361:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1361:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1361:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1361:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1361:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1362:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1362:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1362:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1362:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1362:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1362:17: sparse:    =
right side has type unsigned long long
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1364:17: sparse: spa=
rse: invalid assignment: &=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1364:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1364:17: sparse:    =
right side has type int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1364:17: sparse: spa=
rse: invalid assignment: |=3D
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1364:17: sparse:    =
left side has type restricted __le32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1364:17: sparse:    =
right side has type unsigned long long
>> drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1377:21: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected re=
stricted __le32 [addressable] [usertype] lo @@     got unsigned int @@
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1377:21: sparse:    =
 expected restricted __le32 [addressable] [usertype] lo
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1377:21: sparse:    =
 got unsigned int
>> drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1378:21: sparse: spa=
rse: incorrect type in assignment (different base types) @@     expected re=
stricted __le32 [addressable] [usertype] hi @@     got int @@
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1378:21: sparse:    =
 expected restricted __le32 [addressable] [usertype] hi
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1378:21: sparse:    =
 got int
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1419:23: sparse: spa=
rse: cast to restricted __be32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1419:23: sparse: spa=
rse: cast to restricted __be32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1419:23: sparse: spa=
rse: cast to restricted __be32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1419:23: sparse: spa=
rse: cast to restricted __be32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1419:23: sparse: spa=
rse: cast to restricted __be32
   drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c:1419:23: sparse: spa=
rse: cast to restricted __be32

vim +1377 drivers/net/ethernet/qlogic/qed/qed_init_fw_funcs.c

  1263	=

  1264	void qed_gft_config(struct qed_hwfn *p_hwfn,
  1265			    struct qed_ptt *p_ptt,
  1266			    u16 pf_id,
  1267			    bool tcp,
  1268			    bool udp,
  1269			    bool ipv4, bool ipv6, enum gft_profile_type profile_type)
  1270	{
  1271		u32 reg_val, cam_line, search_non_ip_as_gft;
  1272		struct regpair ram_line =3D { };
  1273	=

  1274		if (!ipv6 && !ipv4)
  1275			DP_NOTICE(p_hwfn,
  1276				  "gft_config: must accept at least on of - ipv4 or ipv6'\n");
  1277		if (!tcp && !udp)
  1278			DP_NOTICE(p_hwfn,
  1279				  "gft_config: must accept at least on of - udp or tcp\n");
  1280		if (profile_type >=3D MAX_GFT_PROFILE_TYPE)
  1281			DP_NOTICE(p_hwfn, "gft_config: unsupported gft_profile_type\n");
  1282	=

  1283		/* Set RFS event ID to be awakened i Tstorm By Prs */
  1284		reg_val =3D T_ETH_PACKET_MATCH_RFS_EVENTID <<
  1285			  PRS_REG_CM_HDR_GFT_EVENT_ID_SHIFT;
  1286		reg_val |=3D PARSER_ETH_CONN_CM_HDR << PRS_REG_CM_HDR_GFT_CM_HDR_SH=
IFT;
  1287		qed_wr(p_hwfn, p_ptt, PRS_REG_CM_HDR_GFT, reg_val);
  1288	=

  1289		/* Do not load context only cid in PRS on match. */
  1290		qed_wr(p_hwfn, p_ptt, PRS_REG_LOAD_L2_FILTER, 0);
  1291	=

  1292		/* Do not use tenant ID exist bit for gft search */
  1293		qed_wr(p_hwfn, p_ptt, PRS_REG_SEARCH_TENANT_ID, 0);
  1294	=

  1295		/* Set Cam */
  1296		cam_line =3D 0;
  1297		SET_FIELD(cam_line, GFT_CAM_LINE_MAPPED_VALID, 1);
  1298	=

  1299		/* Filters are per PF!! */
  1300		SET_FIELD(cam_line,
  1301			  GFT_CAM_LINE_MAPPED_PF_ID_MASK,
  1302			  GFT_CAM_LINE_MAPPED_PF_ID_MASK_MASK);
  1303		SET_FIELD(cam_line, GFT_CAM_LINE_MAPPED_PF_ID, pf_id);
  1304	=

  1305		if (!(tcp && udp)) {
  1306			SET_FIELD(cam_line,
  1307				  GFT_CAM_LINE_MAPPED_UPPER_PROTOCOL_TYPE_MASK,
  1308				  GFT_CAM_LINE_MAPPED_UPPER_PROTOCOL_TYPE_MASK_MASK);
  1309			if (tcp)
  1310				SET_FIELD(cam_line,
  1311					  GFT_CAM_LINE_MAPPED_UPPER_PROTOCOL_TYPE,
  1312					  GFT_PROFILE_TCP_PROTOCOL);
  1313			else
  1314				SET_FIELD(cam_line,
  1315					  GFT_CAM_LINE_MAPPED_UPPER_PROTOCOL_TYPE,
  1316					  GFT_PROFILE_UDP_PROTOCOL);
  1317		}
  1318	=

  1319		if (!(ipv4 && ipv6)) {
  1320			SET_FIELD(cam_line, GFT_CAM_LINE_MAPPED_IP_VERSION_MASK, 1);
  1321			if (ipv4)
  1322				SET_FIELD(cam_line,
  1323					  GFT_CAM_LINE_MAPPED_IP_VERSION,
  1324					  GFT_PROFILE_IPV4);
  1325			else
  1326				SET_FIELD(cam_line,
  1327					  GFT_CAM_LINE_MAPPED_IP_VERSION,
  1328					  GFT_PROFILE_IPV6);
  1329		}
  1330	=

  1331		/* Write characteristics to cam */
  1332		qed_wr(p_hwfn, p_ptt, PRS_REG_GFT_CAM + CAM_LINE_SIZE * pf_id,
  1333		       cam_line);
  1334		cam_line =3D
  1335		    qed_rd(p_hwfn, p_ptt, PRS_REG_GFT_CAM + CAM_LINE_SIZE * pf_id);
  1336	=

  1337		/* Write line to RAM - compare to filter 4 tuple */
  1338	=

  1339		/* Search no IP as GFT */
  1340		search_non_ip_as_gft =3D 0;
  1341	=

  1342		/* Tunnel type */
  1343		SET_FIELD(ram_line.lo, GFT_RAM_LINE_TUNNEL_DST_PORT, 1);
  1344		SET_FIELD(ram_line.lo, GFT_RAM_LINE_TUNNEL_OVER_IP_PROTOCOL, 1);
  1345	=

  1346		if (profile_type =3D=3D GFT_PROFILE_TYPE_4_TUPLE) {
  1347			SET_FIELD(ram_line.hi, GFT_RAM_LINE_DST_IP, 1);
  1348			SET_FIELD(ram_line.hi, GFT_RAM_LINE_SRC_IP, 1);
  1349			SET_FIELD(ram_line.hi, GFT_RAM_LINE_OVER_IP_PROTOCOL, 1);
  1350			SET_FIELD(ram_line.lo, GFT_RAM_LINE_ETHERTYPE, 1);
  1351			SET_FIELD(ram_line.lo, GFT_RAM_LINE_SRC_PORT, 1);
  1352			SET_FIELD(ram_line.lo, GFT_RAM_LINE_DST_PORT, 1);
  1353		} else if (profile_type =3D=3D GFT_PROFILE_TYPE_L4_DST_PORT) {
  1354			SET_FIELD(ram_line.hi, GFT_RAM_LINE_OVER_IP_PROTOCOL, 1);
  1355			SET_FIELD(ram_line.lo, GFT_RAM_LINE_ETHERTYPE, 1);
  1356			SET_FIELD(ram_line.lo, GFT_RAM_LINE_DST_PORT, 1);
  1357		} else if (profile_type =3D=3D GFT_PROFILE_TYPE_IP_DST_ADDR) {
  1358			SET_FIELD(ram_line.hi, GFT_RAM_LINE_DST_IP, 1);
  1359			SET_FIELD(ram_line.lo, GFT_RAM_LINE_ETHERTYPE, 1);
  1360		} else if (profile_type =3D=3D GFT_PROFILE_TYPE_IP_SRC_ADDR) {
  1361			SET_FIELD(ram_line.hi, GFT_RAM_LINE_SRC_IP, 1);
  1362			SET_FIELD(ram_line.lo, GFT_RAM_LINE_ETHERTYPE, 1);
  1363		} else if (profile_type =3D=3D GFT_PROFILE_TYPE_TUNNEL_TYPE) {
  1364			SET_FIELD(ram_line.lo, GFT_RAM_LINE_TUNNEL_ETHERTYPE, 1);
  1365	=

  1366			/* Allow tunneled traffic without inner IP */
  1367			search_non_ip_as_gft =3D 1;
  1368		}
  1369	=

  1370		qed_wr(p_hwfn,
  1371		       p_ptt, PRS_REG_SEARCH_NON_IP_AS_GFT, search_non_ip_as_gft);
  1372		qed_dmae_to_grc(p_hwfn, p_ptt, (u32 *)&ram_line,
  1373				PRS_REG_GFT_PROFILE_MASK_RAM + RAM_LINE_SIZE * pf_id,
  1374				sizeof(ram_line) / REG_SIZE);
  1375	=

  1376		/* Set default profile so that no filter match will happen */
> 1377		ram_line.lo =3D 0xffffffff;
> 1378		ram_line.hi =3D 0x3ff;
  1379		qed_dmae_to_grc(p_hwfn, p_ptt, (u32 *)&ram_line,
  1380				PRS_REG_GFT_PROFILE_MASK_RAM + RAM_LINE_SIZE *
  1381				PRS_GFT_CAM_LINES_NO_MATCH,
  1382				sizeof(ram_line) / REG_SIZE);
  1383	=

  1384		/* Enable gft search */
  1385		qed_wr(p_hwfn, p_ptt, PRS_REG_SEARCH_GFT, 1);
  1386	}
  1387	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0265230894910744795==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
H4816Sr0lAEA
--===============0265230894910744795==--

