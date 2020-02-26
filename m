Content-Type: multipart/mixed; boundary="===============1989711188569556451=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mchinth:sep_socwatch_linux_5_6 19/32] drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Wed, 26 Feb 2020 14:56:07 +0800
Message-ID: <202002261438.EiYiDmGJ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1989711188569556451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_6
head:   34184f3283b8378250c1c30d96b47c9d4bef20e5
commit: e97564df950c79039c7eb7868d0fb5bb06737657 [19/32] platform/x86: Use =
$(srctree) instead of $(src) to adapt to kbuild regression
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout e97564df950c79039c7eb7868d0fb5bb06737657
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse: sparse: incor=
rect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse:    expected v=
oid [noderef] <asn:1> *to
   drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse:    got char *=
[assigned] out_arg
   drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse: sparse: incor=
rect type in argument 2 (different address spaces)
   drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse:    expected v=
oid [noderef] <asn:1> *buffer
   drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse:    got char *=
remote_buffer
   drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse: sparse: incor=
rect type in argument 2 (different address spaces)
   drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse:    expected v=
oid const [noderef] <asn:1> *from
   drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse:    got char *=
remote_cfg
--
>> drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse: sparse: i=
ncorrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse:    expect=
ed unsigned int flags
   drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse:    got re=
stricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse:    expe=
cted void [noderef] <asn:1> *to
   drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse:    got =
void *dest
   drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse:    expe=
cted void [noderef] <asn:1> *to
   drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse:    got =
void *
>> drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse: sparse:=
 incorrect type in argument 1 (different base types)
   drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse:    expe=
cted unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse:    got =
restricted gfp_t
>> drivers/platform/x86/socwatch/sw_output_buffer.c:398:6: sparse: sparse: =
symbol 'reset_output_buffers' was not declared. Should it be static?
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse: sparse:=
 incorrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse:    expe=
cted unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse:    got =
restricted gfp_t
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse: sparse:=
 incorrect type in argument 1 (different base types)
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse:    expe=
cted unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse:    got =
restricted gfp_t
   drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse: sparse:=
 incorrect type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse:    expe=
cted void *dest
   drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse:    got =
void [noderef] <asn:1> *buffer
--
>> drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse: s=
parse: incorrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse:  =
  expected unsigned int flags
   drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse:  =
  got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse: sparse: inco=
rrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse:    expected =
unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse:    got restr=
icted gfp_t
>> drivers/platform/x86/socwatch/sw_collector.c:85:33: sparse: sparse: symb=
ol 'sw_copy_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:116:5: sparse: sparse: symb=
ol 'sw_init_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:138:5: sparse: sparse: symb=
ol 'sw_init_ops_i' was not declared. Should it be static?
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse: sparse: inc=
orrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse:    expected=
 unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse:    got rest=
ricted gfp_t
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse: sparse: inc=
orrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse:    expected=
 unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse:    got rest=
ricted gfp_t
>> drivers/platform/x86/socwatch/sw_collector.c:211:24: sparse: sparse: sym=
bol 'sw_alloc_ops_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:323:6: sparse: sparse: symb=
ol 'sw_free_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:329:6: sparse: sparse: symb=
ol 'sw_free_ops_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:335:5: sparse: sparse: symb=
ol 'sw_reset_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:453:6: sparse: sparse: symb=
ol 'sw_free_collector_msg_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:459:6: sparse: sparse: symb=
ol 'sw_handle_per_cpu_msg_i' was not declared. Should it be static?
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse: sparse: inc=
orrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse:    expected=
 unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse:    got rest=
ricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_mem.c:141:18: sparse: sparse: cast to r=
estricted gfp_t
   drivers/platform/x86/socwatch/sw_mem.c:305:38: sparse: sparse: cast to r=
estricted gfp_t
--
   drivers/platform/x86/socwatch/sw_telem.c:239:39: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:239:33: sparse: sparse: cast fr=
om unknown type
   drivers/platform/x86/socwatch/sw_telem.c:242:34: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:242:28: sparse: sparse: cast fr=
om unknown type
   drivers/platform/x86/socwatch/sw_telem.c:245:64: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:245:58: sparse: sparse: cast fr=
om unknown type
>> drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] s_punitInterfaceAddr
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] s_punitDataAddr
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse:    got unsigned=
 long long volatile [usertype] *ssram_virt_addr
   drivers/platform/x86/socwatch/sw_telem.c:280:34: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:280:28: sparse: sparse: cast fr=
om unknown type
   drivers/platform/x86/socwatch/sw_telem.c:283:34: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:283:28: sparse: sparse: cast fr=
om unknown type
   drivers/platform/x86/socwatch/sw_telem.c:286:35: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:286:29: sparse: sparse: cast fr=
om unknown type
   drivers/platform/x86/socwatch/sw_telem.c:289:35: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:289:29: sparse: sparse: cast fr=
om unknown type
   drivers/platform/x86/socwatch/sw_telem.c:292:62: sparse: sparse: undefin=
ed identifier 'ioremap_nocache'
   drivers/platform/x86/socwatch/sw_telem.c:292:56: sparse: sparse: cast fr=
om unknown type
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] s_pmcIPCCmdAddr
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] s_pmcIPCStsAddr
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] s_pmcIPCWBufAddr
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse:    got unsigned=
 long long volatile [usertype] *static [toplevel] s_pmcIPCRBufAddr
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse: sparse: incorre=
ct type in argument 1 (different address spaces)
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse:    expected voi=
d volatile [noderef] <asn:2> *addr
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse:    got unsigned=
 long long volatile [usertype] *ssram_virt_addr
>> drivers/platform/x86/socwatch/sw_telem.c:671:5: sparse: sparse: symbol '=
read_telem' was not declared. Should it be static?
--
>> drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse: sparse: inco=
rrect type in argument 2 (different base types)
   drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse:    expected =
unsigned int flags
   drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse:    got restr=
icted gfp_t

vim +1309 drivers/platform/x86/socwatch/sw_driver.c

03b0f13bbabe56 Jon Moeller    2018-11-13  1115  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1116  static long sw_unlocked_han=
dle_ioctl_i(unsigned int ioctl_num,
03b0f13bbabe56 Jon Moeller    2018-11-13  1117  					   void *p_local_args)
03b0f13bbabe56 Jon Moeller    2018-11-13  1118  {
03b0f13bbabe56 Jon Moeller    2018-11-13  1119  	struct sw_driver_ioctl_arg=
 local_args;
03b0f13bbabe56 Jon Moeller    2018-11-13  1120  	int local_in_len, local_ou=
t_len;
03b0f13bbabe56 Jon Moeller    2018-11-13  1121  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1122  	if (!p_local_args) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1123  		pw_pr_error("ERROR: NULL =
p_local_args value?!\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1124  		return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1125  	}
03b0f13bbabe56 Jon Moeller    2018-11-13  1126  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1127  	/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1128  	 * (1) Sanity check:
03b0f13bbabe56 Jon Moeller    2018-11-13  1129  	 * Before doing anything, =
double check to
03b0f13bbabe56 Jon Moeller    2018-11-13  1130  	 * make sure this IOCTL wa=
s really intended
03b0f13bbabe56 Jon Moeller    2018-11-13  1131  	 * for us!
03b0f13bbabe56 Jon Moeller    2018-11-13  1132  	 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1133  	if (_IOC_TYPE(ioctl_num) !=
=3D APWR_IOCTL_MAGIC_NUM) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1134  		pw_pr_error(
0204a36d274378 Faycal Benmlih 2019-04-23  1135  			"ERROR: requested IOCTL =
TYPE (%d) !=3D \
0204a36d274378 Faycal Benmlih 2019-04-23  1136  				APWR_IOCTL_MAGIC_NUM (%=
d)\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1137  			_IOC_TYPE(ioctl_num), AP=
WR_IOCTL_MAGIC_NUM);
03b0f13bbabe56 Jon Moeller    2018-11-13  1138  		return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1139  	}
03b0f13bbabe56 Jon Moeller    2018-11-13  1140  	/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1141  	 * (2) Extract arg lengths.
03b0f13bbabe56 Jon Moeller    2018-11-13  1142  	 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1143  	local_args =3D *((struct s=
w_driver_ioctl_arg *)p_local_args);
03b0f13bbabe56 Jon Moeller    2018-11-13  1144  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1145  	local_in_len =3D local_arg=
s.in_len;
03b0f13bbabe56 Jon Moeller    2018-11-13  1146  	local_out_len =3D local_ar=
gs.out_len;
03b0f13bbabe56 Jon Moeller    2018-11-13  1147  	pw_pr_debug("GU: local_in_=
len =3D %d, local_out_len =3D %d\n", local_in_len,
03b0f13bbabe56 Jon Moeller    2018-11-13  1148  		local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1149  	/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1150  	 * (3) Service individual =
IOCTL requests.
03b0f13bbabe56 Jon Moeller    2018-11-13  1151  	 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1152  	if (MATCH_IOCTL(ioctl_num,=
 PW_IOCTL_CONFIG)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1153  		pw_pr_debug("PW_IOCTL_CON=
FIG\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1154  		return sw_set_driver_info=
s_i(
03b0f13bbabe56 Jon Moeller    2018-11-13  1155  			(struct sw_driver_interf=
ace_msg __user *)
03b0f13bbabe56 Jon Moeller    2018-11-13  1156  				local_args.in_arg,
03b0f13bbabe56 Jon Moeller    2018-11-13  1157  			local_in_len);
0204a36d274378 Faycal Benmlih 2019-04-23  1158  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_CONFIG_CONTINUOUS)) {
0204a36d274378 Faycal Benmlih 2019-04-23  1159  		pw_pr_debug("DEBUG: PW_IO=
CTL_CONFIG_CONTINUOUS\n");
0204a36d274378 Faycal Benmlih 2019-04-23  1160  		return sw_set_continuous_=
i(
0204a36d274378 Faycal Benmlih 2019-04-23  1161  			(struct sw_driver_contin=
uous_collect __user *)
0204a36d274378 Faycal Benmlih 2019-04-23  1162  				local_args.in_arg,
0204a36d274378 Faycal Benmlih 2019-04-23  1163  			local_in_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1164  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_CMD)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1165  		sw_driver_collection_cmd_=
t local_cmd;
03b0f13bbabe56 Jon Moeller    2018-11-13  1166  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1167  		pw_pr_debug("PW_IOCTL_CMD=
\n");
0204a36d274378 Faycal Benmlih 2019-04-23  1168  	if (get_user(local_cmd,
0204a36d274378 Faycal Benmlih 2019-04-23  1169  		(sw_driver_collection_cmd=
_t __user *)local_args.in_arg)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1170  		pw_pr_error("ERROR: could=
 NOT extract cmd value!\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1171  		return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1172  	}
0204a36d274378 Faycal Benmlih 2019-04-23  1173  	return sw_handle_cmd_i(loc=
al_cmd, (u64 __user *)local_args.out_arg);
03b0f13bbabe56 Jon Moeller    2018-11-13  1174  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_POLL)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1175  		pw_pr_debug("PW_IOCTL_POL=
L\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1176  		return DO_PER_CPU_OVERHEA=
D_FUNC_RET(int, sw_collection_poll_i);
03b0f13bbabe56 Jon Moeller    2018-11-13  1177  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_IMMEDIATE_IO)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1178  		struct sw_driver_interfac=
e_info *local_info;
03b0f13bbabe56 Jon Moeller    2018-11-13  1179  		struct sw_driver_io_descr=
iptor *local_descriptor =3D NULL;
03b0f13bbabe56 Jon Moeller    2018-11-13  1180  		int retVal =3D PW_SUCCESS;
03b0f13bbabe56 Jon Moeller    2018-11-13  1181  		char *src_vals =3D NULL;
03b0f13bbabe56 Jon Moeller    2018-11-13  1182  		char *dst_vals =3D NULL;
03b0f13bbabe56 Jon Moeller    2018-11-13  1183  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1184  		pw_pr_debug("PW_IOCTL_IMM=
EDIATE_IO\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1185  		pw_pr_debug("local_in_len=
 =3D %u\n", local_in_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1186  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1187  		src_vals =3D vmalloc(loca=
l_in_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1188  		if (!src_vals) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1189  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1190  				"ERROR allocating space=
 for immediate IO\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1191  			return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1192  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1193  		if (local_out_len) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1194  			dst_vals =3D vmalloc(loc=
al_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1195  			if (!dst_vals) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1196  				vfree(src_vals);
03b0f13bbabe56 Jon Moeller    2018-11-13  1197  				pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1198  					"ERROR allocating spac=
e for immediate IO\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1199  				return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1200  			}
03b0f13bbabe56 Jon Moeller    2018-11-13  1201  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1202  		if (copy_from_user(src_va=
ls, (char __user *)local_args.in_arg,
03b0f13bbabe56 Jon Moeller    2018-11-13  1203  				   local_in_len)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1204  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1205  				"ERROR copying in immed=
iate IO descriptor\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1206  			retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1207  			goto ret_immediate_io;
03b0f13bbabe56 Jon Moeller    2018-11-13  1208  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1209  		local_info =3D (struct sw=
_driver_interface_info *)src_vals;
03b0f13bbabe56 Jon Moeller    2018-11-13  1210  		pw_pr_debug(
03b0f13bbabe56 Jon Moeller    2018-11-13  1211  			"OK, asked to perform im=
mediate IO on cpu(s) %d, # descriptors =3D %d\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1212  			local_info->cpu_mask, lo=
cal_info->num_io_descriptors);
03b0f13bbabe56 Jon Moeller    2018-11-13  1213  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1214  		 * For now, require only =
a single descriptor.
03b0f13bbabe56 Jon Moeller    2018-11-13  1215  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1216  		if (local_info->num_io_de=
scriptors !=3D 1) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1217  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1218  				"ERROR: told to perform=
 immediate IO with %d descriptors -- MAX of 1 descriptor allowed!\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1219  				local_info->num_io_desc=
riptors);
03b0f13bbabe56 Jon Moeller    2018-11-13  1220  			retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1221  			goto ret_immediate_io;
03b0f13bbabe56 Jon Moeller    2018-11-13  1222  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1223  		local_descriptor =3D ((st=
ruct sw_driver_io_descriptor *)
03b0f13bbabe56 Jon Moeller    2018-11-13  1224  						local_info->descripto=
rs);
03b0f13bbabe56 Jon Moeller    2018-11-13  1225  		pw_pr_debug("Collection t=
ype after %d\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1226  				local_descriptor->colle=
ction_type);
03b0f13bbabe56 Jon Moeller    2018-11-13  1227  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1228  		 * Check cpu mask for cor=
rectness here. For now, we do NOT allow
03b0f13bbabe56 Jon Moeller    2018-11-13  1229  		 * reading on ALL cpus.
03b0f13bbabe56 Jon Moeller    2018-11-13  1230  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1231  		if ((int)local_info->cpu_=
mask < -1 ||
03b0f13bbabe56 Jon Moeller    2018-11-13  1232  			(int)local_info->cpu_mas=
k >=3D (int)sw_max_num_cpus) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1233  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1234  				"ERROR: invalid cpu mas=
k %d specified in immediate IO; valid values are: -1, [0 -- %d]!\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1235  				local_info->cpu_mask, s=
w_max_num_cpus - 1);
03b0f13bbabe56 Jon Moeller    2018-11-13  1236  			retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1237  			goto ret_immediate_io;
03b0f13bbabe56 Jon Moeller    2018-11-13  1238  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1239  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1240  		 * Check collection type =
for correctness here
03b0f13bbabe56 Jon Moeller    2018-11-13  1241  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1242  		pw_pr_debug(
03b0f13bbabe56 Jon Moeller    2018-11-13  1243  			"Asked to perform immedi=
ate IO with descriptor with type =3D %d, on cpu =3D %d\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1244  			local_descriptor->collec=
tion_type,
03b0f13bbabe56 Jon Moeller    2018-11-13  1245  			local_info->cpu_mask);
03b0f13bbabe56 Jon Moeller    2018-11-13  1246  		if (sw_is_valid_hw_op_id(=
local_descriptor->collection_type) =3D=3D
03b0f13bbabe56 Jon Moeller    2018-11-13  1247  			false) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1248  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1249  				"ERROR: invalid collect=
ion type %d specified for immediate IO\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1250  				(int)local_descriptor->=
collection_type);
03b0f13bbabe56 Jon Moeller    2018-11-13  1251  			retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1252  			goto ret_immediate_io;
03b0f13bbabe56 Jon Moeller    2018-11-13  1253  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1254  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1255  		 * Check collection cmd f=
or correctness here
03b0f13bbabe56 Jon Moeller    2018-11-13  1256  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1257  		if (local_descriptor->col=
lection_command < SW_IO_CMD_READ ||
03b0f13bbabe56 Jon Moeller    2018-11-13  1258  			local_descriptor->collec=
tion_command > SW_IO_CMD_WRITE) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1259  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1260  				"ERROR: invalid collect=
ion command %d specified for immediate IO\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1261  				local_descriptor->colle=
ction_command);
03b0f13bbabe56 Jon Moeller    2018-11-13  1262  			retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1263  			goto ret_immediate_io;
03b0f13bbabe56 Jon Moeller    2018-11-13  1264  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1265  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1266  		 * Initialize the descrip=
tor -- 'MMIO' and 'IPC' reads may need
03b0f13bbabe56 Jon Moeller    2018-11-13  1267  		 * an "ioremap_nocache"
03b0f13bbabe56 Jon Moeller    2018-11-13  1268  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1269  		if (sw_init_driver_io_des=
criptor(local_descriptor)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1270  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1271  				"ERROR initializing imm=
ediate IO descriptor\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1272  			retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1273  			goto ret_immediate_io;
03b0f13bbabe56 Jon Moeller    2018-11-13  1274  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1275  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1276  		 * OK, perform the actual=
 IO.
03b0f13bbabe56 Jon Moeller    2018-11-13  1277  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1278  		{
03b0f13bbabe56 Jon Moeller    2018-11-13  1279  			struct sw_immediate_requ=
est_info request_info =3D {
03b0f13bbabe56 Jon Moeller    2018-11-13  1280  				local_descriptor, dst_v=
als, &retVal
03b0f13bbabe56 Jon Moeller    2018-11-13  1281  			};
03b0f13bbabe56 Jon Moeller    2018-11-13  1282  			struct cpumask cpumask;
03b0f13bbabe56 Jon Moeller    2018-11-13  1283  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1284  			cpumask_clear(&cpumask);
03b0f13bbabe56 Jon Moeller    2018-11-13  1285  			switch (local_info->cpu_=
mask) {
fb06f8f3289f69 Jon Moeller    2018-12-15  1286  			case -1: /* IO on ANY CP=
U (assume current CPU) */
03b0f13bbabe56 Jon Moeller    2018-11-13  1287  				cpumask_set_cpu(RAW_CPU=
(), &cpumask);
03b0f13bbabe56 Jon Moeller    2018-11-13  1288  				pw_pr_debug("ANY CPU\n"=
);
03b0f13bbabe56 Jon Moeller    2018-11-13  1289  				break;
fb06f8f3289f69 Jon Moeller    2018-12-15  1290  			default: /* IO on a part=
icular CPU */
03b0f13bbabe56 Jon Moeller    2018-11-13  1291  				cpumask_set_cpu(local_i=
nfo->cpu_mask, &cpumask);
03b0f13bbabe56 Jon Moeller    2018-11-13  1292  				pw_pr_debug("[%d] setti=
ng for %d\n", RAW_CPU(),
03b0f13bbabe56 Jon Moeller    2018-11-13  1293  						local_info->cpu_mask);
03b0f13bbabe56 Jon Moeller    2018-11-13  1294  				break;
03b0f13bbabe56 Jon Moeller    2018-11-13  1295  			}
03b0f13bbabe56 Jon Moeller    2018-11-13  1296  			sw_schedule_work(&cpumas=
k,
03b0f13bbabe56 Jon Moeller    2018-11-13  1297  					 &sw_handle_immediate_=
request_i,
03b0f13bbabe56 Jon Moeller    2018-11-13  1298  					 &request_info);
03b0f13bbabe56 Jon Moeller    2018-11-13  1299  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1300  		if (retVal !=3D PW_SUCCES=
S) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1301  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1302  				"ERROR performing immed=
iate IO on one (or more) CPUs!\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1303  			goto ret_immediate_io_re=
set;
03b0f13bbabe56 Jon Moeller    2018-11-13  1304  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1305  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1306  		 * OK, all done.
03b0f13bbabe56 Jon Moeller    2018-11-13  1307  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1308  		if (local_descriptor->col=
lection_command =3D=3D SW_IO_CMD_READ) {
03b0f13bbabe56 Jon Moeller    2018-11-13 @1309  			if (copy_to_user(local_a=
rgs.out_arg, dst_vals,
03b0f13bbabe56 Jon Moeller    2018-11-13  1310  					 local_out_len)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1311  				pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1312  					"ERROR copying %u byte=
s of value to userspace!\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1313  					local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1314  				retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1315  				goto ret_immediate_io_r=
eset;
03b0f13bbabe56 Jon Moeller    2018-11-13  1316  			}
03b0f13bbabe56 Jon Moeller    2018-11-13  1317  			pw_pr_debug(
03b0f13bbabe56 Jon Moeller    2018-11-13  1318  				"OK, copied %u bytes of=
 value to userspace addr %p!\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1319  				local_out_len, local_ar=
gs.out_arg);
03b0f13bbabe56 Jon Moeller    2018-11-13  1320  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1321  ret_immediate_io_reset:
03b0f13bbabe56 Jon Moeller    2018-11-13  1322  		/*
03b0f13bbabe56 Jon Moeller    2018-11-13  1323  		 * Reset the descriptor -=
- 'MMIO' and 'IPC' reads may have
03b0f13bbabe56 Jon Moeller    2018-11-13  1324  		 * performed an "ioremap_=
nocache" which now needs to be
03b0f13bbabe56 Jon Moeller    2018-11-13  1325  		 * unmapped.
03b0f13bbabe56 Jon Moeller    2018-11-13  1326  		 */
03b0f13bbabe56 Jon Moeller    2018-11-13  1327  		if (sw_reset_driver_io_de=
scriptor(local_descriptor)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1328  			pw_pr_error(
03b0f13bbabe56 Jon Moeller    2018-11-13  1329  				"ERROR resetting immedi=
ate IO descriptor\n");
03b0f13bbabe56 Jon Moeller    2018-11-13  1330  			retVal =3D -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1331  			goto ret_immediate_io;
03b0f13bbabe56 Jon Moeller    2018-11-13  1332  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1333  ret_immediate_io:
03b0f13bbabe56 Jon Moeller    2018-11-13  1334  		vfree(src_vals);
0204a36d274378 Faycal Benmlih 2019-04-23  1335  		if (dst_vals)
03b0f13bbabe56 Jon Moeller    2018-11-13  1336  			vfree(dst_vals);
0204a36d274378 Faycal Benmlih 2019-04-23  1337  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1338  		return retVal;
03b0f13bbabe56 Jon Moeller    2018-11-13  1339  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_GET_SCU_FW_VERSION)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1340  		u32 local_data =3D (u32)s=
w_scu_fw_major_minor;
03b0f13bbabe56 Jon Moeller    2018-11-13  1341  =

03b0f13bbabe56 Jon Moeller    2018-11-13  1342  		if (put_user(local_data, =
(u32 __user *)local_args.out_arg)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1343  			pw_pr_error(
0204a36d274378 Faycal Benmlih 2019-04-23  1344  				"ERROR copying scu fw v=
ersion to userspace!\n"
0204a36d274378 Faycal Benmlih 2019-04-23  1345  				);
03b0f13bbabe56 Jon Moeller    2018-11-13  1346  			return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1347  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1348  		return PW_SUCCESS;
03b0f13bbabe56 Jon Moeller    2018-11-13  1349  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_GET_DRIVER_VERSION)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1350  		pw_u64_t local_version =
=3D
03b0f13bbabe56 Jon Moeller    2018-11-13  1351  			(pw_u64_t)SW_DRIVER_VERS=
ION_MAJOR << 32 |
03b0f13bbabe56 Jon Moeller    2018-11-13  1352  			(pw_u64_t)SW_DRIVER_VERS=
ION_MINOR << 16 |
03b0f13bbabe56 Jon Moeller    2018-11-13  1353  			(pw_u64_t)SW_DRIVER_VERS=
ION_OTHER;
0204a36d274378 Faycal Benmlih 2019-04-23  1354  		if (put_user(local_versio=
n,
0204a36d274378 Faycal Benmlih 2019-04-23  1355  			(u64 __user *)local_args=
.out_arg)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1356  			pw_pr_error(
0204a36d274378 Faycal Benmlih 2019-04-23  1357  				"ERROR copying driver v=
ersion to userspace!\n"
0204a36d274378 Faycal Benmlih 2019-04-23  1358  				);
03b0f13bbabe56 Jon Moeller    2018-11-13  1359  			return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1360  		}
03b0f13bbabe56 Jon Moeller    2018-11-13  1361  		return PW_SUCCESS;
0204a36d274378 Faycal Benmlih 2019-04-23  1362  	} else if (MATCH_IOCTL(ioc=
tl_num,
0204a36d274378 Faycal Benmlih 2019-04-23  1363  			PW_IOCTL_GET_AVAILABLE_T=
RACEPOINTS)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1364  		pw_pr_debug("DEBUG: AVAIL=
 tracepoints! local_out_len =3D %u\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1365  			local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1366  		return sw_get_available_n=
ame_id_mappings_i(
03b0f13bbabe56 Jon Moeller    2018-11-13  1367  			SW_NAME_TYPE_TRACEPOINT,
03b0f13bbabe56 Jon Moeller    2018-11-13  1368  			(struct sw_name_info_msg=
 __user *)local_args.out_arg,
03b0f13bbabe56 Jon Moeller    2018-11-13  1369  			local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1370  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_GET_AVAILABLE_NOTIFIERS)) {
0204a36d274378 Faycal Benmlih 2019-04-23  1371  		pw_pr_debug("DEBUG: AVAIL=
 notifiers! local_out_len =3D %u\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1372  			local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1373  		return sw_get_available_n=
ame_id_mappings_i(
03b0f13bbabe56 Jon Moeller    2018-11-13  1374  			SW_NAME_TYPE_NOTIFIER,
03b0f13bbabe56 Jon Moeller    2018-11-13  1375  			(struct sw_name_info_msg=
 __user *)local_args.out_arg,
03b0f13bbabe56 Jon Moeller    2018-11-13  1376  			local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1377  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_GET_AVAILABLE_COLLECTORS)) {
0204a36d274378 Faycal Benmlih 2019-04-23  1378  		pw_pr_debug("DEBUG: AVAIL=
 collectors! local_out_len =3D %u\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1379  			local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1380  		return sw_get_available_n=
ame_id_mappings_i(
03b0f13bbabe56 Jon Moeller    2018-11-13  1381  			SW_NAME_TYPE_COLLECTOR,
03b0f13bbabe56 Jon Moeller    2018-11-13  1382  			(struct sw_name_info_msg=
 __user *)local_args.out_arg,
03b0f13bbabe56 Jon Moeller    2018-11-13  1383  			local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1384  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_GET_TOPOLOGY_CHANGES)) {
03b0f13bbabe56 Jon Moeller    2018-11-13  1385  		pw_pr_debug("DEBUG: TOPOL=
OGY changes! local_out_len =3D %u\n",
03b0f13bbabe56 Jon Moeller    2018-11-13  1386  			local_out_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1387  		return sw_get_topology_ch=
anges_i(
03b0f13bbabe56 Jon Moeller    2018-11-13  1388  			(struct sw_driver_topolo=
gy_msg __user *)
0204a36d274378 Faycal Benmlih 2019-04-23  1389  				local_args.out_arg, loc=
al_out_len);
0204a36d274378 Faycal Benmlih 2019-04-23  1390  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_READ_CONTINUOUS)) {
0204a36d274378 Faycal Benmlih 2019-04-23  1391  		pw_pr_debug("DEBUG: READ_=
CONTINUOUS!\n");
0204a36d274378 Faycal Benmlih 2019-04-23  1392  		return sw_read_continuous=
_i(local_args.out_arg, local_out_len);
0204a36d274378 Faycal Benmlih 2019-04-23  1393  	} else if (MATCH_IOCTL(ioc=
tl_num, PW_IOCTL_SET_TELEM_BAR)) {
0204a36d274378 Faycal Benmlih 2019-04-23  1394  		pw_pr_debug("DEBUG: got a=
 request to set telem bar!\n");
0204a36d274378 Faycal Benmlih 2019-04-23  1395  		return sw_set_telem_cfgs_=
i(local_args.in_arg, local_in_len);
03b0f13bbabe56 Jon Moeller    2018-11-13  1396  	}
0204a36d274378 Faycal Benmlih 2019-04-23  1397  =

0204a36d274378 Faycal Benmlih 2019-04-23  1398  	pw_pr_error("ERROR: invali=
d ioctl num: %u\n", _IOC_NR(ioctl_num));
03b0f13bbabe56 Jon Moeller    2018-11-13  1399  	return -PW_ERROR;
03b0f13bbabe56 Jon Moeller    2018-11-13  1400  }
03b0f13bbabe56 Jon Moeller    2018-11-13  1401  =


:::::: The code@line 1309 was first introduced by commit
:::::: 03b0f13bbabe56099bf57c2ea0481128dd7e75c7 platform/x86: add sep and s=
ocwatch drivers without socperf.

:::::: TO: Jon Moeller <jon.moeller@intel.com>
:::::: CC: Manisha Chinthapally <manisha.chinthapally@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1989711188569556451==--

