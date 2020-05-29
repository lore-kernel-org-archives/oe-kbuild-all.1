Content-Type: multipart/mixed; boundary="===============3691161829966921619=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/cdns3/gadget.c:1188:29: sparse: sparse: incorrect type in assignment (different base types)
Date: Sat, 30 May 2020 06:08:19 +0800
Message-ID: <202005300615.M9n2mKaR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3691161829966921619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   75caf310d16cc5e2f851c048cd597f5437013368
commit: 70d8b9e5e63d212019ba3f6823c8ec3d2df87645 usb: cdns3: make signed 1 =
bit bitfields unsigned
date:   9 weeks ago
config: i386-randconfig-s031-20200529 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-243-gc100a7ab-dirty
        git checkout 70d8b9e5e63d212019ba3f6823c8ec3d2df87645
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Di386 CF=3D'-fdiagnostic-prefix -D__CHECK_EN=
DIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/usb/cdns3/gadget.c:1157:35: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1157:35: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1157:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1173:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1173:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1173:29: sparse:     got unsigned long
>> drivers/usb/cdns3/gadget.c:1188:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] length @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1188:29: sparse:     expected restricted __le=
32 [usertype] length
   drivers/usb/cdns3/gadget.c:1188:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1191:37: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1191:37: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1191:37: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1213:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1213:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1213:38: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:1215:48: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1215:48: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1215:48: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:1229:30: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1229:30: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1229:30: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1255:36: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1255:30: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:1255:30: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1255:30: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:1010:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1010:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1010:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1013:29: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1013:29: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:1013:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1019:21: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] length @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:1019:21: sparse:     expected restricted __le=
32 [usertype] length
   drivers/usb/cdns3/gadget.c:1019:21: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:1029:37: sparse: sparse: invalid assignment: =
|=3D
   drivers/usb/cdns3/gadget.c:1029:37: sparse:    left side has type restri=
cted __le32
   drivers/usb/cdns3/gadget.c:1029:37: sparse:    right side has type unsig=
ned long
   drivers/usb/cdns3/gadget.c:1033:22: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:1033:22: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:1033:22: sparse:     got unsigned int [assign=
ed] [usertype] control
   drivers/usb/cdns3/gadget.c:85:6: sparse: sparse: symbol 'cdns3_clear_reg=
ister_bit' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:140:26: sparse: sparse: symbol 'cdns3_next_al=
ign_buf' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:151:22: sparse: sparse: symbol 'cdns3_next_pr=
iv_request' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:193:5: sparse: sparse: symbol 'cdns3_ring_siz=
e' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:263:34: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:263:34: sparse:     expected restricted __le3=
2 [usertype] buffer
   drivers/usb/cdns3/gadget.c:263:34: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:264:35: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:264:35: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:264:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:348:6: sparse: sparse: symbol 'cdns3_move_deq=
_to_next_trb' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:514:20: sparse: sparse: symbol 'cdns3_wa2_gad=
get_giveback' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:554:5: sparse: sparse: symbol 'cdns3_wa2_gadg=
et_ep_queue' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:849:49: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/usb/cdns3/gadget.c:848:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:848:51: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:848:51: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:852:49: sparse: sparse: restricted __le32 deg=
rades to integer
   drivers/usb/cdns3/gadget.c:851:51: sparse: sparse: incorrect type in ass=
ignment (different base types) @@     expected restricted __le32 [usertype]=
 control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:851:51: sparse:     expected restricted __le3=
2 [usertype] control
   drivers/usb/cdns3/gadget.c:851:51: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:839:6: sparse: sparse: symbol 'cdns3_wa1_rest=
ore_cycle_bit' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:1393:17: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1442:21: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:1574:35: sparse: sparse: dubious: x | !y
   drivers/usb/cdns3/gadget.c:1907:6: sparse: sparse: symbol 'cdns3_stream_=
ep_reconfig' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:1928:6: sparse: sparse: symbol 'cdns3_configu=
re_dmult' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:2552:34: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] buffer @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2552:34: sparse:     expected restricted __le=
32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:2552:34: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2554:46: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2554:35: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2554:35: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2554:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2610:43: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2610:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2610:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2610:38: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2625:43: sparse: sparse: restricted __le32 de=
grades to integer
   drivers/usb/cdns3/gadget.c:2625:38: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected restricted __le32 [usertype=
] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2625:38: sparse:     expected restricted __le=
32 [usertype] control
   drivers/usb/cdns3/gadget.c:2625:38: sparse:     got unsigned long
--
   drivers/usb/cdns3/ep0.c:40:37: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] buf=
fer @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:40:37: sparse:     expected restricted __le32 [u=
sertype] buffer
   drivers/usb/cdns3/ep0.c:40:37: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:41:37: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] len=
gth @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:41:37: sparse:     expected restricted __le32 [u=
sertype] length
   drivers/usb/cdns3/ep0.c:41:37: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:44:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:44:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:44:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:45:45: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] buf=
fer @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:45:45: sparse:     expected restricted __le32 [u=
sertype] buffer
   drivers/usb/cdns3/ep0.c:45:45: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:46:45: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] len=
gth @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:46:45: sparse:     expected restricted __le32 [u=
sertype] length
   drivers/usb/cdns3/ep0.c:46:45: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:47:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:47:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:47:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:50:46: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] con=
trol @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:50:46: sparse:     expected restricted __le32 [u=
sertype] control
   drivers/usb/cdns3/ep0.c:50:46: sparse:     got unsigned long
   drivers/usb/cdns3/ep0.c:267:52: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned char [usertype] ep_add=
r @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:267:52: sparse:     expected unsigned char [user=
type] ep_addr
   drivers/usb/cdns3/ep0.c:267:52: sparse:     got restricted __le16 [usert=
ype] wIndex
>> drivers/usb/cdns3/ep0.c:271:47: sparse: sparse: incorrect type in argume=
nt 2 (different base types) @@     expected unsigned int [usertype] ep @@  =
   got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:271:47: sparse:     expected unsigned int [usert=
ype] ep
   drivers/usb/cdns3/ep0.c:271:47: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:387:19: sparse: sparse: restricted __le16 degrad=
es to integer
   drivers/usb/cdns3/ep0.c:390:44: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned char [usertype] ep_add=
r @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:390:44: sparse:     expected unsigned char [user=
type] ep_addr
   drivers/usb/cdns3/ep0.c:390:44: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:393:39: sparse: sparse: incorrect type in argume=
nt 2 (different base types) @@     expected unsigned int [usertype] ep @@  =
   got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:393:39: sparse:     expected unsigned int [usert=
ype] ep
   drivers/usb/cdns3/ep0.c:393:39: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:454:21: sparse: sparse: restricted __le16 degrad=
es to integer
   drivers/usb/cdns3/ep0.c:478:31: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned short [usertype] isoch=
_delay @@     got restricted __le16 [usertype] wValue @@
   drivers/usb/cdns3/ep0.c:478:31: sparse:     expected unsigned short [use=
rtype] isoch_delay
   drivers/usb/cdns3/ep0.c:478:31: sparse:     got restricted __le16 [usert=
ype] wValue

vim +1188 drivers/usb/cdns3/gadget.c

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1079  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1080  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  1081   * cdns3_ep_run_transfer - =
start transfer on no-default endpoint hardware
7733f6c32e36ff Pawel Laszczak 2019-08-26  1082   * @priv_ep: endpoint object
7733f6c32e36ff Pawel Laszczak 2019-08-26  1083   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  1084   * Returns zero on success =
or negative value on failure
7733f6c32e36ff Pawel Laszczak 2019-08-26  1085   */
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1086  static int cdns3_ep_run_tra=
nsfer(struct cdns3_endpoint *priv_ep,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1087  				 struct usb_request *re=
quest)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1088  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1089  	struct cdns3_device *priv_=
dev =3D priv_ep->cdns3_dev;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1090  	struct cdns3_request *priv=
_req;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1091  	struct cdns3_trb *trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1092  	dma_addr_t trb_dma;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1093  	u32 togle_pcs =3D 1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1094  	int sg_iter =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1095  	int num_trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1096  	int address;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1097  	u32 control;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1098  	int pcs;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1099  	u16 total_tdl =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1100  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1101  	if (priv_ep->type =3D=3D U=
SB_ENDPOINT_XFER_ISOC)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1102  		num_trb =3D priv_ep->inte=
rval;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1103  	else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1104  		num_trb =3D request->num_=
sgs ? request->num_sgs : 1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1105  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1106  	if (num_trb > priv_ep->fre=
e_trbs) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1107  		priv_ep->flags |=3D EP_RI=
NG_FULL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1108  		return -ENOBUFS;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1109  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1110  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1111  	priv_req =3D to_cdns3_requ=
est(request);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1112  	address =3D priv_ep->endpo=
int.desc->bEndpointAddress;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1113  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1114  	priv_ep->flags |=3D EP_PEN=
DING_REQUEST;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1115  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1116  	/* must allocate buffer al=
igned to 8 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1117  	if (priv_req->flags & REQU=
EST_UNALIGNED)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1118  		trb_dma =3D priv_req->ali=
gned_buf->dma;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1119  	else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1120  		trb_dma =3D request->dma;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1121  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1122  	trb =3D priv_ep->trb_pool =
+ priv_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1123  	priv_req->start_trb =3D pr=
iv_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1124  	priv_req->trb =3D trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1125  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1126  	cdns3_select_ep(priv_ep->c=
dns3_dev, address);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1127  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1128  	/* prepare ring */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1129  	if ((priv_ep->enqueue + nu=
m_trb)  >=3D (priv_ep->num_trbs - 1)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1130  		struct cdns3_trb *link_tr=
b;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1131  		int doorbell, dma_index;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1132  		u32 ch_bit =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1133  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1134  		doorbell =3D !!(readl(&pr=
iv_dev->regs->ep_cmd) & EP_CMD_DRDY);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1135  		dma_index =3D cdns3_get_d=
ma_pos(priv_dev, priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1136  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1137  		/* Driver can't update LI=
NK TRB if it is current processed. */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1138  		if (doorbell && dma_index=
 =3D=3D priv_ep->num_trbs - 1) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1139  			priv_ep->flags |=3D EP_D=
EFERRED_DRDY;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1140  			return -ENOBUFS;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1141  		}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1142  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1143  		/*updating C bt in  Link =
TRB before starting DMA*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1144  		link_trb =3D priv_ep->trb=
_pool + (priv_ep->num_trbs - 1);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1145  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1146  		 * For TRs size equal 2 e=
nabling TRB_CHAIN for epXin causes
7733f6c32e36ff Pawel Laszczak 2019-08-26  1147  		 * that DMA stuck at the =
LINK TRB.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1148  		 * On the other hand, rem=
oving TRB_CHAIN for longer TRs for
7733f6c32e36ff Pawel Laszczak 2019-08-26  1149  		 * epXout cause that DMA =
stuck after handling LINK TRB.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1150  		 * To eliminate this stra=
nge behavioral driver set TRB_CHAIN
7733f6c32e36ff Pawel Laszczak 2019-08-26  1151  		 * bit only for TR size >=
 2.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1152  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1153  		if (priv_ep->type =3D=3D =
USB_ENDPOINT_XFER_ISOC ||
7733f6c32e36ff Pawel Laszczak 2019-08-26  1154  		    TRBS_PER_SEGMENT > 2)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1155  			ch_bit =3D TRB_CHAIN;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1156  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1157  		link_trb->control =3D ((p=
riv_ep->pcs) ? TRB_CYCLE : 0) |
7733f6c32e36ff Pawel Laszczak 2019-08-26  1158  				    TRB_TYPE(TRB_LINK) =
| TRB_TOGGLE | ch_bit;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1159  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1160  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1161  	if (priv_dev->dev_ver <=3D=
 DEV_VER_V2)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1162  		togle_pcs =3D cdns3_wa1_u=
pdate_guard(priv_ep, trb);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1163  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1164  	/* set incorrect Cycle Bit=
 for first trb*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1165  	control =3D priv_ep->pcs ?=
 0 : TRB_CYCLE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1166  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1167  	do {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1168  		u32 length;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1169  		u16 td_size =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1170  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1171  		/* fill TRB */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1172  		control |=3D TRB_TYPE(TRB=
_NORMAL);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1173  		trb->buffer =3D TRB_BUFFE=
R(request->num_sgs =3D=3D 0
7733f6c32e36ff Pawel Laszczak 2019-08-26  1174  				? trb_dma : request->sg=
[sg_iter].dma_address);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1175  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1176  		if (likely(!request->num_=
sgs))
7733f6c32e36ff Pawel Laszczak 2019-08-26  1177  			length =3D request->leng=
th;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1178  		else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1179  			length =3D request->sg[s=
g_iter].length;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1180  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1181  		if (likely(priv_dev->dev_=
ver >=3D DEV_VER_V2))
7733f6c32e36ff Pawel Laszczak 2019-08-26  1182  			td_size =3D DIV_ROUND_UP=
(length,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1183  					       priv_ep->endpoi=
nt.maxpacket);
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1184  		else if (priv_ep->flags &=
 EP_TDLCHK_EN)
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1185  			total_tdl +=3D DIV_ROUND=
_UP(length,
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1186  					       priv_ep->endpoi=
nt.maxpacket);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1187  =

7733f6c32e36ff Pawel Laszczak 2019-08-26 @1188  		trb->length =3D TRB_BURST=
_LEN(priv_ep->trb_burst_size) |
7733f6c32e36ff Pawel Laszczak 2019-08-26  1189  					TRB_LEN(length);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1190  		if (priv_dev->gadget.spee=
d =3D=3D USB_SPEED_SUPER)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1191  			trb->length |=3D TRB_TDL=
_SS_SIZE(td_size);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1192  		else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1193  			control |=3D TRB_TDL_HS_=
SIZE(td_size);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1194  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1195  		pcs =3D priv_ep->pcs ? TR=
B_CYCLE : 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1196  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1197  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1198  		 * first trb should be pr=
epared as last to avoid processing
7733f6c32e36ff Pawel Laszczak 2019-08-26  1199  		 *  transfer to early
7733f6c32e36ff Pawel Laszczak 2019-08-26  1200  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1201  		if (sg_iter !=3D 0)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1202  			control |=3D pcs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1203  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1204  		if (priv_ep->type =3D=3D =
USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1205  			control |=3D TRB_IOC | T=
RB_ISP;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1206  		} else {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1207  			/* for last element in T=
D or in SG list */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1208  			if (sg_iter =3D=3D (num_=
trb - 1) && sg_iter !=3D 0)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1209  				control |=3D pcs | TRB_=
IOC | TRB_ISP;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1210  		}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1211  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1212  		if (sg_iter)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1213  			trb->control =3D control;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1214  		else
7733f6c32e36ff Pawel Laszczak 2019-08-26  1215  			priv_req->trb->control =
=3D control;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1216  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1217  		control =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1218  		++sg_iter;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1219  		priv_req->end_trb =3D pri=
v_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1220  		cdns3_ep_inc_enq(priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1221  		trb =3D priv_ep->trb_pool=
 + priv_ep->enqueue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1222  	} while (sg_iter < num_trb=
);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1223  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1224  	trb =3D priv_req->trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1225  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1226  	priv_req->flags |=3D REQUE=
ST_PENDING;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1227  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1228  	if (sg_iter =3D=3D 1)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1229  		trb->control |=3D TRB_IOC=
 | TRB_ISP;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1230  =

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1231  	if (priv_dev->dev_ver < DE=
V_VER_V2 &&
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1232  	    (priv_ep->flags & EP_T=
DLCHK_EN)) {
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1233  		u16 tdl =3D total_tdl;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1234  		u16 old_tdl =3D EP_CMD_TD=
L_GET(readl(&priv_dev->regs->ep_cmd));
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1235  =

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1236  		if (tdl > EP_CMD_TDL_MAX)=
 {
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1237  			tdl =3D EP_CMD_TDL_MAX;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1238  			priv_ep->pending_tdl =3D=
 total_tdl - EP_CMD_TDL_MAX;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1239  		}
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1240  =

54c4c69f0baa43 Jayshri Pawar  2019-12-13  1241  		if (old_tdl < tdl) {
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1242  			tdl -=3D old_tdl;
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1243  			writel(EP_CMD_TDL_SET(td=
l) | EP_CMD_STDL,
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1244  			       &priv_dev->regs->=
ep_cmd);
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1245  		}
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1246  	}
54c4c69f0baa43 Jayshri Pawar  2019-12-13  1247  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1248  	/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1249  	 * Memory barrier - cycle =
bit must be set before other filds in trb.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1250  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1251  	wmb();
7733f6c32e36ff Pawel Laszczak 2019-08-26  1252  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1253  	/* give the TD to the cons=
umer*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1254  	if (togle_pcs)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1255  		trb->control =3D  trb->co=
ntrol ^ 1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1256  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1257  	if (priv_dev->dev_ver <=3D=
 DEV_VER_V2)
7733f6c32e36ff Pawel Laszczak 2019-08-26  1258  		cdns3_wa1_tray_restore_cy=
cle_bit(priv_dev, priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1259  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1260  	trace_cdns3_prepare_trb(pr=
iv_ep, priv_req->trb);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1261  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1262  	/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1263  	 * Memory barrier - Cycle =
Bit must be set before trb->length  and
7733f6c32e36ff Pawel Laszczak 2019-08-26  1264  	 * trb->buffer fields.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1265  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1266  	wmb();
7733f6c32e36ff Pawel Laszczak 2019-08-26  1267  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1268  	/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1269  	 * For DMULT mode we can s=
et address to transfer ring only once after
7733f6c32e36ff Pawel Laszczak 2019-08-26  1270  	 * enabling endpoint.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1271  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1272  	if (priv_ep->flags & EP_UP=
DATE_EP_TRBADDR) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1273  		/*
7733f6c32e36ff Pawel Laszczak 2019-08-26  1274  		 * Until SW is not ready =
to handle the OUT transfer the ISO OUT
7733f6c32e36ff Pawel Laszczak 2019-08-26  1275  		 * Endpoint should be dis=
abled (EP_CFG.ENABLE =3D 0).
7733f6c32e36ff Pawel Laszczak 2019-08-26  1276  		 * EP_CFG_ENABLE must be =
set before updating ep_traddr.
7733f6c32e36ff Pawel Laszczak 2019-08-26  1277  		 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1278  		if (priv_ep->type =3D=3D =
USB_ENDPOINT_XFER_ISOC  && !priv_ep->dir &&
7733f6c32e36ff Pawel Laszczak 2019-08-26  1279  		    !(priv_ep->flags & EP=
_QUIRK_ISO_OUT_EN)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1280  			priv_ep->flags |=3D EP_Q=
UIRK_ISO_OUT_EN;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1281  			cdns3_set_register_bit(&=
priv_dev->regs->ep_cfg,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1282  					       EP_CFG_ENABLE);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1283  		}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1284  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1285  		writel(EP_TRADDR_TRADDR(p=
riv_ep->trb_pool_dma +
7733f6c32e36ff Pawel Laszczak 2019-08-26  1286  					priv_req->start_trb * =
TRB_SIZE),
7733f6c32e36ff Pawel Laszczak 2019-08-26  1287  					&priv_dev->regs->ep_tr=
addr);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1288  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1289  		priv_ep->flags &=3D ~EP_U=
PDATE_EP_TRBADDR;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1290  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1291  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1292  	if (!priv_ep->wa1_set && !=
(priv_ep->flags & EP_STALLED)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  1293  		trace_cdns3_ring(priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1294  		/*clearing TRBERR and EP_=
STS_DESCMIS before seting DRDY*/
7733f6c32e36ff Pawel Laszczak 2019-08-26  1295  		writel(EP_STS_TRBERR | EP=
_STS_DESCMIS, &priv_dev->regs->ep_sts);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1296  		writel(EP_CMD_DRDY, &priv=
_dev->regs->ep_cmd);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1297  		trace_cdns3_doorbell_epx(=
priv_ep->name,
7733f6c32e36ff Pawel Laszczak 2019-08-26  1298  					 readl(&priv_dev->regs=
->ep_traddr));
7733f6c32e36ff Pawel Laszczak 2019-08-26  1299  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  1300  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1301  	/* WORKAROUND for transiti=
on to L0 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  1302  	__cdns3_gadget_wakeup(priv=
_dev);
7733f6c32e36ff Pawel Laszczak 2019-08-26  1303  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  1304  	return 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  1305  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  1306  =


:::::: The code at line 1188 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB=
3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3691161829966921619==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
OQZIWBb/UHxGF/o5eeUf5VYrG4pdAgA=
--===============3691161829966921619==--

