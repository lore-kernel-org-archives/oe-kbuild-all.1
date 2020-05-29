Content-Type: multipart/mixed; boundary="===============5325676797849575969=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/cdns3/gadget.c:1213:38: sparse: sparse: incorrect type in assignment (different base types)
Date: Fri, 29 May 2020 12:11:06 +0800
Message-ID: <202005291203.bFo1t6Vr%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5325676797849575969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   75caf310d16cc5e2f851c048cd597f5437013368
commit: 70d8b9e5e63d212019ba3f6823c8ec3d2df87645 usb: cdns3: make signed 1 =
bit bitfields unsigned
date:   9 weeks ago
config: nios2-randconfig-s031-20200528 (attached as .config)
compiler: nios2-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-240-gf0fe1cd9-dirty
        git checkout 70d8b9e5e63d212019ba3f6823c8ec3d2df87645
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Dnios2 CF=3D'-fdiagnostic-prefix -D__CHECK_E=
NDIAN__'

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
   drivers/usb/cdns3/gadget.c:1188:29: sparse: sparse: incorrect type in as=
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
>> drivers/usb/cdns3/gadget.c:1213:38: sparse: sparse: incorrect type in as=
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
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
--
   drivers/usb/cdns3/ep0.c:40:37: sparse: sparse: incorrect type in assignm=
ent (different base types) @@     expected restricted __le32 [usertype] buf=
fer @@     got unsigned long @@
   drivers/usb/cdns3/ep0.c:40:37: sparse:     expected restricted __le32 [u=
sertype] buffer
   drivers/usb/cdns3/ep0.c:40:37: sparse:     got unsigned long
>> drivers/usb/cdns3/ep0.c:41:37: sparse: sparse: incorrect type in assignm=
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
>> drivers/usb/cdns3/ep0.c:267:52: sparse: sparse: incorrect type in argume=
nt 1 (different base types) @@     expected unsigned char [usertype] ep_add=
r @@     got restricted __le16 [usertype] wIndex @@
   drivers/usb/cdns3/ep0.c:267:52: sparse:     expected unsigned char [user=
type] ep_addr
   drivers/usb/cdns3/ep0.c:267:52: sparse:     got restricted __le16 [usert=
ype] wIndex
   drivers/usb/cdns3/ep0.c:271:47: sparse: sparse: incorrect type in argume=
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
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]

vim +1213 drivers/usb/cdns3/gadget.c

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

7733f6c32e36ff Pawel Laszczak 2019-08-26  1188  		trb->length =3D TRB_BURST=
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
7733f6c32e36ff Pawel Laszczak 2019-08-26 @1213  			trb->control =3D control;
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


:::::: The code at line 1213 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB=
3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5325676797849575969==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
7NvIk2LW8TiWl5P/ByplSfZriAEA
--===============5325676797849575969==--

