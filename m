Content-Type: multipart/mixed; boundary="===============0941025237558009814=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 5/7] usb: isp1760: add support for isp1763
Date: Fri, 07 May 2021 00:50:02 +0800
Message-ID: <202105070028.XpLAB6uC-lkp@intel.com>
In-Reply-To: <20210504101910.18619-6-rui.silva@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0941025237558009814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rui,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next v5.12 next-20210506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rui-Miguel-Silva/usb-isp17=
60-extend-support-for-isp1763/20210504-182126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
config: x86_64-randconfig-s022-20210506 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/e20d3193f1d1eef8bfdf1eb6a=
4001a916d4c463c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rui-Miguel-Silva/usb-isp1760-exten=
d-support-for-isp1763/20210504-182126
        git checkout e20d3193f1d1eef8bfdf1eb6a4001a916d4c463c
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D=
1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/usb/isp1760/isp1760-hcd.c:300:32: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:321:23: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:397:38: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int val @@  =
   got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:397:38: sparse:     expected unsigned =
int val
   drivers/usb/isp1760/isp1760-hcd.c:397:38: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:418:30: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int val @@  =
   got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:418:30: sparse:     expected unsigned =
int val
   drivers/usb/isp1760/isp1760-hcd.c:418:30: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:487:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:487:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:487:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw0 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:487:18: sparse:     expected restricte=
d __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:487:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:488:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:488:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:488:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw1 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:488:18: sparse:     expected restricte=
d __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:488:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:489:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:489:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:489:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw2 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:489:18: sparse:     expected restricte=
d __dw [usertype] dw2
   drivers/usb/isp1760/isp1760-hcd.c:489:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:490:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:490:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:490:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw3 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:490:18: sparse:     expected restricte=
d __dw [usertype] dw3
   drivers/usb/isp1760/isp1760-hcd.c:490:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:491:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:491:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:491:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw4 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:491:18: sparse:     expected restricte=
d __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:491:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:492:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:492:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:492:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw5 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:492:18: sparse:     expected restricte=
d __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:492:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:493:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:493:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:493:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw6 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:493:18: sparse:     expected restricte=
d __dw [usertype] dw6
   drivers/usb/isp1760/isp1760-hcd.c:493:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:494:20: sparse: sparse: cast to restri=
cted __le32
   drivers/usb/isp1760/isp1760-hcd.c:494:20: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:494:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw7 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:494:18: sparse:     expected restricte=
d __dw [usertype] dw7
   drivers/usb/isp1760/isp1760-hcd.c:494:18: sparse:     got unsigned int [=
usertype]
   drivers/usb/isp1760/isp1760-hcd.c:514:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:514:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw0 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:514:17: sparse:     expected restricte=
d __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:514:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:515:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:515:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw1 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:515:17: sparse:     expected restricte=
d __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:515:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:516:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:516:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw2 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:516:17: sparse:     expected restricte=
d __dw [usertype] dw2
   drivers/usb/isp1760/isp1760-hcd.c:516:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:517:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:517:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw3 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:517:17: sparse:     expected restricte=
d __dw [usertype] dw3
   drivers/usb/isp1760/isp1760-hcd.c:517:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:518:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:518:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw4 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:518:17: sparse:     expected restricte=
d __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:518:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:519:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:519:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw5 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:519:17: sparse:     expected restricte=
d __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:519:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:520:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:520:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw6 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:520:17: sparse:     expected restricte=
d __dw [usertype] dw6
   drivers/usb/isp1760/isp1760-hcd.c:520:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:521:19: sparse: sparse: cast from rest=
ricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:521:17: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw7 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:521:17: sparse:     expected restricte=
d __dw [usertype] dw7
   drivers/usb/isp1760/isp1760-hcd.c:521:17: sparse:     got restricted __l=
e32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:536:65: sparse: sparse: incorrect type=
 in argument 3 (different base types) @@     expected unsigned int const [u=
sertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:536:65: sparse:     expected unsigned =
int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:536:65: sparse:     got restricted __d=
w *
   drivers/usb/isp1760/isp1760-hcd.c:539:46: sparse: sparse: incorrect type=
 in argument 3 (different base types) @@     expected unsigned int const [u=
sertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:539:46: sparse:     expected unsigned =
int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:539:46: sparse:     got restricted __d=
w *
   drivers/usb/isp1760/isp1760-hcd.c:802:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw0 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:802:18: sparse:     expected restricte=
d __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:802:18: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:803:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:803:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:803:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:804:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:804:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:804:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:805:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:805:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:805:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:808:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw1 @@     got unsigned int @@
   drivers/usb/isp1760/isp1760-hcd.c:808:18: sparse:     expected restricte=
d __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:808:18: sparse:     got unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:809:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:809:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:809:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:810:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:810:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:810:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:813:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:813:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:813:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:815:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:815:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:815:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:820:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:820:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:820:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:822:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:822:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:822:34: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:824:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:824:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:824:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:825:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:825:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:825:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:830:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:830:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:830:34: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:835:26: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:835:26: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:835:26: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:838:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:838:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:838:34: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:842:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:842:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:842:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:843:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:843:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:843:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:846:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:846:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:846:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:847:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:847:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:847:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:850:34: sparse: sparse: invalid assign=
ment: &=3D
   drivers/usb/isp1760/isp1760-hcd.c:850:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:850:34: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:852:34: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:852:34: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:852:34: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:855:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:855:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:855:18: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:857:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:857:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:857:18: sparse:    right side has type=
 int
   drivers/usb/isp1760/isp1760-hcd.c:902:26: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw5 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:902:26: sparse:     expected restricte=
d __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:902:26: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:908:18: sparse: sparse: invalid assign=
ment: |=3D
   drivers/usb/isp1760/isp1760-hcd.c:908:18: sparse:    left side has type =
restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:908:18: sparse:    right side has type=
 unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:909:18: sparse: sparse: incorrect type=
 in assignment (different base types) @@     expected restricted __dw [user=
type] dw4 @@     got unsigned int [assigned] [usertype] usof @@
   drivers/usb/isp1760/isp1760-hcd.c:909:18: sparse:     expected restricte=
d __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:909:18: sparse:     got unsigned int [=
assigned] [usertype] usof
   drivers/usb/isp1760/isp1760-hcd.c:1241:13: sparse: sparse: bad assignmen=
t (>>=3D) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1246:16: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1251:33: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1272:29: sparse: sparse: bad assignmen=
t (>>=3D) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1285:16: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1286:24: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1288:26: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1303:17: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1303:47: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1309:14: sparse: sparse: restricted __=
dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1309:49: sparse: sparse: restricted __=
dw degrades to integer

vim +487 drivers/usb/isp1760/isp1760-hcd.c

   478	=

   479	static void isp1763_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u3=
2 slot,
   480				     struct ptd *ptd)
   481	{
   482		u16 src_offset =3D ptd_offset + slot * sizeof(*ptd);
   483		struct ptd le32_ptd;
   484	=

   485		isp1763_mem_read(hcd, src_offset, (u16 *)&le32_ptd, sizeof(le32_ptd=
));
   486		/* Normalize the data obtained */
 > 487		ptd->dw0 =3D le32_to_cpu(le32_ptd.dw0);
 > 488		ptd->dw1 =3D le32_to_cpu(le32_ptd.dw1);
 > 489		ptd->dw2 =3D le32_to_cpu(le32_ptd.dw2);
 > 490		ptd->dw3 =3D le32_to_cpu(le32_ptd.dw3);
 > 491		ptd->dw4 =3D le32_to_cpu(le32_ptd.dw4);
 > 492		ptd->dw5 =3D le32_to_cpu(le32_ptd.dw5);
 > 493		ptd->dw6 =3D le32_to_cpu(le32_ptd.dw6);
 > 494		ptd->dw7 =3D le32_to_cpu(le32_ptd.dw7);
   495	}
   496	=

   497	static void ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
   498			     struct ptd *ptd)
   499	{
   500		struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
   501	=

   502		if (!priv->is_isp1763)
   503			return isp1760_ptd_read(hcd, ptd_offset, slot, ptd);
   504	=

   505		isp1763_ptd_read(hcd, ptd_offset, slot, ptd);
   506	}
   507	=

   508	static void isp1763_ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u=
32 slot,
   509				      struct ptd *cpu_ptd)
   510	{
   511		u16 dst_offset =3D ptd_offset + slot * sizeof(*cpu_ptd);
   512		struct ptd ptd;
   513	=

 > 514		ptd.dw0 =3D cpu_to_le32(cpu_ptd->dw0);
 > 515		ptd.dw1 =3D cpu_to_le32(cpu_ptd->dw1);
 > 516		ptd.dw2 =3D cpu_to_le32(cpu_ptd->dw2);
 > 517		ptd.dw3 =3D cpu_to_le32(cpu_ptd->dw3);
 > 518		ptd.dw4 =3D cpu_to_le32(cpu_ptd->dw4);
 > 519		ptd.dw5 =3D cpu_to_le32(cpu_ptd->dw5);
 > 520		ptd.dw6 =3D cpu_to_le32(cpu_ptd->dw6);
 > 521		ptd.dw7 =3D cpu_to_le32(cpu_ptd->dw7);
   522	=

   523		isp1763_mem_write(hcd, dst_offset,  (u16 *)&ptd.dw0,
   524				  8 * sizeof(ptd.dw0));
   525	}
   526	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0941025237558009814==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICNIZlGAAAy5jb25maWcAjFxLdxw3rt7nV/RxNsnCjiTLPc65RwtWFaub6XqZZPVDGx5Fbnt0
IksZPSbxv78AWQ+SheqMF4maAN8g8AEE68cfflyw15fHbzcvd7c39/ffF1+PD8enm5fj58WXu/vj
/y2yelHVesEzod8Bc3H38Pr3L39/XJrl5eLDu/OLd2dvn27/tdgcnx6O94v08eHL3ddXaODu8eGH
H39I6yoXK5OmZsulEnVlNN/rqzdfb2/f/rr4KTv+fnfzsPj13Xto5uLiZ/fXG6+aUGaVplff+6LV
2NTVr2fvz84G3oJVq4E0FBcZNpHk2dgEFPVsF+8/nF0M5R7hzBtCyipTiGoztuAVGqWZFmlAWzNl
mCrNqtY1SRAVVOUeqa6Ulm2qa6nGUiE/mV0tvX6TVhSZFiU3miUFN6qWeqTqteQMplvlNfwHWBRW
hU34cbGym3q/eD6+vP45bouohDa82homYfqiFPrq/QWwD8MqGwHdaK704u558fD4gi0M61WnrOgX
7M0bqtiw1l8CO36jWKE9/jXbcrPhsuKFWV2LZmT3KQlQLmhScV0ymrK/nqtRzxEuacK10ihBw9J4
4/VXJqbbUZ9iwLGfou+vT9euT5MviW0LZ9QVZjxnbaGtRHh70xeva6UrVvKrNz89PD4cf34z9qUO
aiualOioqZXYm/JTy1tP1v1SrJzqwl/YHdPp2lgqObVU1kqZkpe1PBimNUvXJF+reCESksRa0GXE
eO1+MwndWw4cGyuK/gjBaVw8v/7+/P355fhtPEIrXnEpUntYG1kn3kx9klrXO5rC85ynWmDXeW5K
d2gjvoZXmaisRqAbKcVKghqCc0iSRfUb9uGT10xmQFJG7YzkCjqgq6Zr/0RiSVaXTFRhmRIlxWTW
gktc0cO08VIJej4dYdJPMF+mJUgRbA8oG9CaNBfOS27tupiyzng4xLyWKc86rQmrO1JVw6Ti3egG
sfFbznjSrnIVitfx4fPi8UskKKN5qtONqlvo08l4Vns9WqnzWew5/E5V3rJCZExzUzClTXpIC0Lk
rI3YjhIckW17fMsrrU4STSJrlqXQ0Wm2EraaZb+1JF9ZK9M2OORItTpNkDatHa5U1mL1Fs+eOX33
7fj0TB07MLkbU1cczpXX5/oajooUdWYN8rBzVY0UkRW0SnHkvC2KeTKlLsRqjSLWjd522InAZNxj
a43kvGw0tFpxSmd25G1dtJVm8uDPoyOeqJbWUKtfPVjZX/TN8x+LFxjO4gaG9vxy8/K8uLm9fXx9
eLl7+BqtJ24FS20b7jwMPW+F1BEZN5hcLzwfVv5G3jllq9I1nEC2XcVnLVEZatOUg66HZjTZEYoL
oi9FUhslyOP5P6zKcOxgwkLVRa9Z7arKtF0oQiBhBwzQ/FnAT8P3IJHUlinH7FePinB6to3uKBGk
SVGbcapcS5ZGBGwYVq8oEOaVvmlASsVhYxRfpUkh7Kke1i+c/6BQN+4PT8VuBtmsU794DeqW+zi3
qBEZ5mAjRa6vLs78ctyCku09+vnFKPSi0gDAWc6jNs7fB2LWArp2eNnKm9Vc/Xaq238fP7/eH58W
X443L69Px2db3E2WoAYqW7VNAxhcmaotmUkY+CBpYEos145VGoja9t5WJWuMLhKTF61aT/wDmNP5
xceohaGfmJquZN02ypc6wEbpisZOltmtwimGRmT0meroMpsBrR09B2G+5pJmaQCZzRzZrnrGtyKd
QX+OAxqZ1Qr9HLjMT9GT5iTZGnjaHAAMBoAAqomuv+bppqlhn9A2ADShJ9JpPvCObH80z0HlCkYC
yh1ATrhl/VHlBfOwVVJscPUsepAeoLO/WQmtORDhIXyZRU4XFES+FpSELhYUWM9qVHTZrCtiSZQb
AoTQBUnqGg1YqEXgUNQNWBNxzRGw2W2tZQnHjPsDiNkU/EF5rJmpZbMG133HpKfxBjck0BoiO1/G
PKDPU95YRGl1agxpUtVsYJRgMnCY3uSafPzhbML4O+qpBI9LwCnxUK1acY2ugRkhXSQmHYGYdA7z
zYpguRzycriFRBOoWD2XzSnaqhS+K+/t0nTaoyVngKRjbNWPrNV8P7Zif4Ly8RaqqX34qsSqYoUf
yrFTyAPP3ELSnDosag2q0WdlgpZZUZtW0rCFZVuheL/anhGDphMmpfB3bYMsh1JNS0wAy8fSBNAG
rAKKOeg4gsMuJ5569BgD8TITtD/ant6NR7bfhA72B4pAwRSA8+f8aGkrk0tqu0CrNU4fxlEB6gfF
5w0/LZtAXyj+iWgN2uBZxrP4UMEITOytNOn52WVvxLvgY3N8+vL49O3m4fa44P89PgCqY2DHU8R1
gMdHsBa2OAzLKn1HhGmbbWn9SxJF/o89egi6dB06iE6fO1W0iRtEoNvqsmGwd3JDW4mCJTNtBVqi
qGk2lsDmyRXvhcQ7bkhDW44Q0EjQInUZNunTMaAAOJU+eG2eA/xqGHRD+Ox23oj0wO/Wgvkn/qA0
Lw04jwxDsyIXaRTmAHSZiyLAXFYxWxMcOGVhDLRnXl4mvqe9t4Ht4LdvRl2UFrV/xtM68w973eqm
1cZaJ3315nj/ZXn59u+Py7fLSz80ugF73sM5b56apRsH0ie0smyjM10igpQVGGrhnO+ri4+nGNge
w7okQy9cfUMz7QRs0Nz5chJvUcxkPkjoCYGh8AoHLWbsVgUegeucHXqjavIsnTYC2k4kEkMhWQiD
Bq2EMoXd7CkaAwiGIXxu0QLBAXIFwzLNCmRMRzoJMKwDmc4rltybufWdepLVadCUxGDNuvVvEQI+
ezZINjcekXBZuVAWWG8lkiIesmoVxgnnyNYQ2KVjhVm3ACiKZGS5rmEdYP/ee7jPRkFtZd8QKUBP
as2yemfqPId1uDr7+/MX+Hd7NvwLT5NRZTMZa+fPtDZm6m19DsCEM1kcUgzacQ9CNSvnxBWgR8Hy
foj8JhgXd+cIt4unTsNY89A8Pd4en58fnxYv3/90Pr/n7EUr4B1Kf9g4lZwz3UruXABfEyJxf8Ea
kZIqGsllY4OKJH1VF1ku1JoE+BowUHBZhK3xvYatRvGZIE0kb1Vob7GM6iRgwENYgBKgccDIUTSK
dn2QhZXjmAhHbgBYKjdl4iG9vmRq/pynVJcgijn4MIO6oGJKBzhNgM/AAVi13A9GwtozjGEFILgr
O+HrDSyqEZWNwRK94rTXW9RGRQLSB3aqk71xYcJIWX+UABJEw3Rh4KbFUCUIdaE7/DsOaEsJyTDM
KOw2nf8Q+xha/I2JYl0j3LFjoTBeKqthoGOUYfORXLKyUfQhKBES0ndhYDDrkuh5UPQ+FO4FUVZg
fzstHkeGkKc4D4hLn6ZVGjYI+HSfrleR5cfY9TYsARspyra0KjtnpSgOV8tLn8EKEziKpfKwQRfK
RMeUFyAeAbyDlkAdusM1FzKxHHC2TtLXh1VNh2R7jhQAKGtnAzOW53rN6r2gBHbdcCdi3sxsGQeP
Fc2w1EHYPSvFzHbvQT8RHVTWFCqEmmAME75CZEMT8b7qw/mE2GPYcU86ilfiFIoq9VTLlNQ1phUm
vNM2qOAjQaz7wkALSi5rdOMwFJHIesMrF93AC7d5CxGqSme5PP/i2+PD3cvjkwvbD6h2hiO0Bs4z
7PYpgM9uEk2B/+G+GREfN5Hk+wJtDwfqqbDog7XNYVkmJEi8WSWIcFTcBHP5E0qLNLCoGE+d8zfd
9RxgA5ACRuCggTzxaBzdHsH+ChnvBWOfGY8r+Kygr1y2yrgoRcFXIAidCcK7uJYj/jnefD7z/oUb
a0OCgJ1rhW6xbG34aEbQ3JUlxrN3nsiWWnqLj78Q7ggNuHW2vFucYRHOZthwuTCkYI9Kz3wezgCw
P32TjqvlHMOZ+SjwIMI9b0sRYBOe01pifW3Oz87mSBcfZknvw1pBc2ee5rq+OvegqlMAa4kXYR7c
5XsenG5bgJ4BBWtSydTaZK2PG5v1QQlUHiDnErHyeSwiGHwBrxY3i7LtfX1wdlYV1L8IEHZ2ADCK
l+ZOmsENAsXjTbLWTdGuQguKqggBQemTz6aBEJ9Kzdb5hNtMeck0eD7SQ6xyguBjzLKvq+JAbmbM
Gd+ZjrarzKwjBzOjTSiccpHD8mT6RKDUOnYFeKQNXtX4oYNTDsTEbWRZZiJdZ2ndeex2qltcmkc1
BcDdBrG09i+rmse/jk8LUPY3X4/fjg8vdiQsbcTi8U9MuHN3V71EO3+QkinfqyoHyD2WsGyLEfZs
isYzoPbpC2TLgDADfLn7BNpyh+ooz0Uq+BiNnFXvvW+IE/PWZ/Krlw97dBSozHrTxo5mKVZr3WX2
YJXGDyTYki7E5AaJxgiaGmMwo6pDXrscK9L3cG01qXTDmVTNm4wG1ziPxg9B2SLJt6becilFxn2P
PmwUVBGRieJzsHi6CdNguQ5xaau1Dwts4Rb6rqOynFXTVQEJnevf4mTJQQiUipoaQXFql32WLLJi
ljgZjGhC1OnTQm0Y1hu7Y6sVWEOMUM61o9cAlViMGuzZt2R7httmJVkWDzymEfJFW1o7xlRgHHdW
juBvzUAPyqjTft6ijsGqk9qEBqWu7sxVseuwVeC5gUrT6/oEm+RZi9oEQ8Q7RBuxxvcVsBPbhnuH
PSzv7qHCLpAwP4Cs0fRtb79s8HeczTVoNIF3iyAR86ANtF7vFvWJN4v86fif1+PD7ffF8+3NfQ/a
PV8LT8VcggpRe2hYfL4/eonVmKISnI++xKzqLeCBzAWpg64HcsmrlrLsPo/2dUBA8QIUw0a5kj6G
4dvQceyDVf1Ha2Ynnbw+9wWLn+AILI4vt+9+9i5z4FQ4J8OzYVBWlu6HH0nHP9BvPz9bh8xplVyc
wbw+tcJPuMaodtKqsCArGXp9IazFW9jEn+/MsN2U7h5unr4v+LfX+5vebvcdsPcXc47a3o/OdvBr
WjRhQS+0XV46BAlbHqTzTIdiR5jfPX376+bpuMie7v4b3J3xzHP64AdGgX0By4Us7SEHoAPgn7r2
3Zk07+6tg5peeQ/pqKhQXa8KPvTjt9CR0HOz/vYEVLuswuPXp5vFl36Gn+0MfZ96hqEnT9Ym0FOb
rYeuMObWwrpf97s5OhJbymVCE7Ldfzj3o/AKw+3nphJx2cWHZVwKuL5V/CrK+r95uv333cvxFgHr
28/HP2EeeNxGzBj4L9HVrXV4wrLenrgYSr/2XbAO5CvMWty4ED8x29/AUwIVlfgOuHtOAd0eFHrq
uY7ijh3d+gM9fc6UjJCzrazwY8pNimY+Mt0Y/sS3CVpUJlE7Fr9BEDB9vAojLoI28QWGK8W4PUWo
G7q8awYso8mpxJK8rdy9I0BChERUQjewBSkaYz67bXEN+DgioiZD0CBWbd0SqcAK9seqe5ckTQAe
0C0aPasur2jKoHgfapkhdvGhcrLobuTuTYu7dzW7tdC8S0j028K7LTX4wjaN2NWIm1QluoLd45R4
D8DGw/GrMneL1ElKqOkdn+Kf5rYHH9LMVlzvTALTcelhEa0Ue5DOkazscCImTMbAK6FWVuAMw8IH
6SZxsgQhDYjA0KG0GW7ukszWoBoh+u9TI2S3RGGoY9w16mBTVCKTpSxbA+AbEHaHlTHBgCRjmirF
0kmXOw0uO7QL78eD6VRCJ1zos0ccXT0X/p2hZXU7c9namV/RpMY9KOjfShG8dZF5/NSqKZ4iwwlS
d2EdaEtHOfnYxW5lAXIXNT25Sx01cFju62aPguta00lUgZtf6No93ovjtBMG0Ab+gxAsx5AQtSQ7
gbydmNp7w1iWUe/xvba6cRNclpFke9mNrUV8M5nxsQGZ5sTH57/G89XGuU+uuIyLe61e2egtyA9e
6BMCPMtHdOXODdAx8SmOo1ghtUSMSgH4kGRXqs6tRteHyTyyPjrPU0zj8Y50nbUYv0EjDAbd6gRi
+fheaDSP9rkRsRHYNdKApd5VMctgcmwPNmIdJH2MUwhyZyIGOwbSFoa1xnQcol0vl2auEZ+FaKoj
W3ZMCIyH6aS+eyg0BQmwwMKFGYeso4nHE1ov1E5KrLqI4vuJh9HRWQRJBhclEe7ikFpvFLZ4t6iy
ETRogCa6f8Yod15yzwlSXN1JHVmdIo3jxWRJcNG6qH0II9C0+ml+8QZ3mZKAkVN5aCY5RSO0nadM
3g47w9y9/+kgEHV453KfQ13bpUCChrB5evQBsjdjg7PpXI203r79/eb5+Hnxh0uN/PPp8ctdHPhA
tm57TmWTWjaX2cdNn+7cp/Gd6ClYE3wpjm6KqMg0wH9wivqmQLuXmJfsHzKbhKswO/TqPNJivjns
5Mi+MzSzCbYdV1ud4ugR66kWlEyHV9czT9l6TkEHGTsy7qzkM0k+HQ9Kxw5Aq1Jo8IY3EUaUVo7o
91pSlDBP0POZ2WA2MyECvTGw76GGiP6YrVzQseaGYYqo7wpX5+OvtnKHxqbx2JWeKJbx0kHX6EPI
0nuuawXAVXbWxUfdcqfgRM8QrUKYoQ2ep33snI05RiPLPCWuLHd01Un5cMYqHBEITMGaBveQZRlu
urH7SOnNPq3bJDzH/6EfEL6q9Xjdhd1OQuNjXJT/fbx9fbn5/f5ovy2xsIkLL14AIhFVXmpUMRMj
QpE6VeQdTMekUimaMMvdEUBe6eQkbAadGTIgOzdsO6fy+O3x6fuiHKOYk7DKyYSDMVuhZFXLKArF
DNBUct+gjqStC7xNkiMmHLEPi++JV/4NWjdi/wmk/8rMu8akkr7dHaa9v3QpOJdRTns6kwdh8ank
eB4DnEw8ck9t8MJEtgrvzK08Gx3nd7s0uToM6qJT6bnTY+RKUTG6/jGFXWT38jmTV5dnvy59VTeF
3HMGzwUv9BoQj4s8jasEXlllk9ioIL2fqgo/iIcDfSF5PYhUzFtWV/8aq1w30Q16X5747sK1KqMV
70ssUpnGkWxCbx9FG8mwklzK0AOPXr7b6JMtn/ppg7ppbAp46LVYCNnkgcy6VzVm8ma4H23bGD3N
x+x7sJ6Lf0DLTnNaf8esedFEz8DndUPfRMWn4Xoosx+WAZOqwjQCoMDyrGQQwMRCHpWpTeJShPsw
l1VV1fHlr8enPwAoTXUUnMYNDxJm8TdMjXkLDnZ0H/4CVVtGJV2V8SgUMylvuSytDaFfWXKE8XRa
yD6Do4IfHyB3Ubg1HR9zNe5BHX7FgH7t1Yz5DjZtj7r3Baam8j+EYX+bbJ02UWdYbDNs5jpDBskk
Tbdb3Mx8VMYRYa9B2st2T2VQWg6j26ri0SPBCuSr3oiZZ6uu4lbTl6hIzev2FG3slu4At8UwOvvc
0gBAzhNFMxPGstRhun5hKLqOL20m4mkJbeYI8wOQbPcPHEiFfcGgFy222Dv8uRqkjZjOwJO2ie/G
9Tanp1+9uX39/e72Tdh6mX2IoP0gddtlKKbbZSfr6DrSd+OWyb2qxfRMk824Jzj75amtXZ7c2yWx
ueEYStEs56mRzPokJfRk1lBmlpJae0uuMoCIBlPL9aHhk9pO0k4MFTVNU3Tf55o5CZbRrv48XfHV
0hS7f+rPsq1LRqNat81NcbqhsgHZoXUJfosFY8glk5vQ4jS6wZgsuH/5IaDYKgDAbLwHLG3ZRJ8S
AR4XpyYHkzQniKBisjSdVawqnVG6cuZzBpr+bhXT4SthjUltgloiJBWs4jE7OMH0BxKQmMiL5cdL
klxcaKqbUoZOsBQZCSfdpQfqIsWiJcciosYWRm8+nl2cB19fGUvNaiupEXkc5VYGkC6N7K8rmbes
ReHpOfjhX31rFiYT4rcNAHQVHAk0Nrj4QPXBmuAxbLOuYUxkA8ui3jVs5ss2nHOc9AfqewY4SZtE
3MOtT6/H1yOArV+6j4gE39vpuE2afIp3CovX+v85+5LmxnGk0fv7FY45vJg5dLRIaqEOfaC4SGhz
M0FJdF0Y7ir3tONzlSvK7m96/v1DAlyQQILqeIdalJnEvmQmcqFDl034jFMrd0SrFWwA64ZVVF3y
zKLcsUeCJk2o73i23EaeLRXapg85VWp7yBa+ig/c7pg4UGxgG7n6K/gn+iIbCRIO591CK8S/OJDA
9GVDrfBpoB9cTRL8OqAWWxWfqntq04/4h+zBHoV4UDZYpWUPCrc01tF9apdI1XI6ZVQdNVtqLynI
yM+QWfQ8yQTp7OChHRGKUyIX34i0hmVEiNsnq6QmZOHrofZf/vH995ff3/rfn94//jHY570+vb+/
/P7y2Qh/Cl/EOTcHSYBAl8zo23ukaGNWJmm3SCNPV9epBATZlar8HPgL3zT8UlNfAXy7VFdekbXF
VqgbcyxqYyOPpWG1zIgpwA7dpeqWIoWkWKgw0i1EpIACWogqZ3Fqw4+I+ihJm+pgExasIY5MwHDB
DpFeHiNBGVENgti7Npgz3Rpggt4fBnKr9pifKX3W1Ow653Z5cNPbUGumhqqLKrHhLCNGUzGkIONT
I409RqQEmKWyAvfJPFBQZ+yAInaSRtTGo96EOPXEsYDOi5gKppGUYLXDK4h++8vXSSktbuMItISa
K+kMG//rQOpP4Ro8ibB6e8aUFF+g4QsczVEv09QfajhQvhkBcSayqk7LC7+y1hGJ9eLW1YyqLlMo
h6Xo3NUl6Sh/4tYZodokeEZnUXkAAVdBCjaoBpqHpkWlwu+eO9xwJVIsa3fDY06Jqk2tbbsmkwEP
0QsBKNCbTr3ojErHGd3h6G9D/DIpo7lYCo1GyXCUOCyZdgi8xx97bOV9wJzbEFTIUQQc30NoaayG
vPt4fv8wnodlq+9bV2RJKcc0Vd0XVckM/4xJ6WoVbyB09ecsOBVNlMhzQ/lZPX3+n+ePu+bpy8sb
PC9/vH1+e0XOVZEhaMxjG1FPGge8XSGaT5o4JGCxLKkrQsIT/RVaHNk8ww6qh3bU+Bv1UaayyhT9
9c/nj7e3jz/uvjz/78vn0dpZf5RrlW86quWg633F71PMDu2ZH4xqR7CMdOd2SNMpXSX3RXvvKr1p
KUZ2pOAJvhEU/ByRYTmHj+LCXwWd1ZA68lY2NFMdR8CkzT27H0FswfJzGkdNYjfwIv7QDSyaC54N
APRDN2do1J6Ce0zX3ltUAgZDYbar4Ux/ynAuE21LZOK8aGqamRXI+5jiPq6sSXMkB4wQfBNfwRgP
v/ZKEI4uKkG8frSImHa/xtkRpHgP3Re5BMn3H3ihpR7Mhs/grkhzcJeXljTiMMYH8EgWp2AaPQSs
6qvyTL7CjdRNCq4n0jYDbFKb9Jgc7CbLJ//RvAlIpKE8Wf0k0jjiVM50RChrqy9NEo02Eku9uKI5
Q2CIeojiWuXsME6DAemldZT4qnbi4rhwI9t77GI+oS3/upHfiGJrRYywvonhlZe3DSkt62SjOPqP
QRzkb1+f7/7z8uP59fn9fdwxd+DaJWB3T3eQZuPu89u3jx9vr3dPr/9++/Hy8YcWU3gqu0j5iWwb
3Ai0UnekWJpevXw+vrG62Dxcost1bKLibQQvpycZvVcG2NJd3rN7Rrpgww2/N6SafS1f7W2ufk+E
aZ1uYYZUEvB7wbtSokWRNBcoscbdFqf1qTcSDIxNy7QDSfwQ3O2RtfrDMQDLmFkAMPRBnRzAjqsK
0KfY+oKfkjy27vny+enHXfby/ArRCb9+/fPboKS4+6f45l/Dqa7d+lBS22S7/W4V4YYWKQMFPwai
BAAAgL3urVZm4waHKOgWzeJlEOyNVBJAoeVmvTbqARC0yQIHAQHq0VU9g5kf22C/xzej7D2Lmwob
ACOw3RR8W48QuyESqtqBhkNd7jXFC8iRb4e1hBeBhEJxi58NK05fb11NrE0FpFrHg+zalBuzJoIm
9K2FbDR5vzkZT5ET6/63Fq+m4F/UtCiFxHw9EK9jAyqBcHxggKMpfppK7P7c1JWIowPnCFJW9lWl
zX0WsbxCuoG0PbWCZBSEZ1Jlbj7Ha5V7OFGsl+WSqYgZ1zbq8GvqI/zuL/kBWKHCdcRLIvCGhf+4
KcY93FSkK7qkKQmPi1pfVuaPId0HivDKpA2YMtWamjA6H8I3QEK0AMCRbmo5AAa3Ob00wPRp3NCL
V37Ha4pvlR/WugWehCR1bBVft4Wz9N4QA7UBKbgxQq7EKCNOWitlQxg6PJDKr5kbTXNen4BrlAX4
GJIEJ3KSkQja8wFDIAixBYxaoylgECj5ewXDSKYHXJNlNsYo1BHXw07JErGnmRxX8GEQ2zo13ZMn
JBGFxCYC77FlCi0g+S3CtPHhL0p5Na9p11KXfvGLX/Yx2lMmpv/Ubjab1QKBlWZCp+AnubKVekRc
3gPbCqkRZo0BWlxZK/52hXACAkgqNVbq2mEdxPbt9EG5ONRvklxew5CySBZuMUHJ8/vLv79dwXcb
+hC/if/wP79/f/vxYbRe7OSrDGRpFYSpVEjM49XZSXEMmkH5hkttqTHKtPjtNzGwL6+AfrYbOxoZ
uqlUn56+PENwOImeZw2y04xl6R2KoyQtY/NYG6ByMKzdNCLJ4dKG4ted7+GCFWgudQwVcbPJUwgJ
eiVOqzT99uX728s3c3YhfKD0siUnBn04FfX+n5ePz3/Q614/Fa+D3rkdAodphbqL0ASLLofjghzC
QU80/S5iFpm/paNJHzOsFBAfGoUO/frp89OPL3e//Xj58m+d+3+EQJFz0fJnX/kmRGzcCgmmCuyw
IhyQFT+xA2WMUifbnb+f62Chv9r7egehH+C4YOZcbKKaGUq+AdS3nIk1RqndBwJp8AXGShA4LVjZ
JQwXYNP1bddb3i1maUUkPjgiD60Jh+NszeWfC/UMbOPiU4EDLo0I6WbTx4bAqhIUPX1/+cKqO65W
m7VKtZHZ7Dqq8LjmfUc9k+mfbkOiueJDcaD7VKFNJ3EBueUcbZ6jWLx8Htjeu8qOdHZWLnfKApt8
uL+0RY114iOsL8BRj/hIrLEyifIKW3fVjaprinIiU1paczCFCHl9E2fZj3nws6vcoDpzOoGkyJBA
GiONj+/aJppjnfxDs/icv5Me+c7ez3SjY5d+LpktnfSmKm/EZXKN0UdBeX/pWHLDK01R0rCLw6Bv
IEgvjcNWUhGAUnYoRrCl4BJNnR5F/1Dx/v4MOU3NqCGyhEi6MA3lyHgbZJ2qhJHMmf1UC04smWNH
8kdAX845hF0/CF6mZbpY1KRH5LSgfmNlxABDgvoAKwpdlz9+rOdUnD/uo0uhqWjgnJJe3HK9Zfp6
BFQmL/TRNRj7TtpbcQrTZGmRiqprdbcCsFkAh46iN6S64sTMaw9FUppE/PFGq4TEjuMSyKitVlLD
khu/erFZkBuHBBaQSIxCcNZkNOZ86CxEgbPEip9y+RA379OPjxepwvj+9OPd4J7hs6jZyXQYpJOk
wI8hLyUNaoCQeCiomGoZE2kBpUKxgFuX9LP85ScPtwkVIWPqSB9o0pLdpgftGAR+Q1yRNQxyHM7i
v4KxhcxrKqFK++Pp27sKUHWXP/0X3Weyy5WRA61NVDIReHuBwM7yld++KqPi56Yqfs5en94FX/bH
y3f7upSDnTE8Yr+mSRobOx7gYtdPWWBRY0QJ0pCiksF/XZOqHPrL+/7KkvbUe7hwA+svYtcYC/Uz
j4D5VEulVCOuHtfag84UCcreNcLFtRnZ0HPLcmPNRYUBwMll5B448NTBoy/MnJKdnr5/h5f+8dHl
97cfiurpM0RyNaa3glOpG20r7JV0euR0KDPZyiLZbTvVfA3M4pMNTPnBJzoa34erNVA7quDxwe+z
PDJegQSmTNuP51f6wUag8/V6daQ4Odmt2FjVk0SBe6/kikjw3Y+CWXKtXSUJXxrBnzdGsUIuVNM9
C603pkc9nz2//v4TCEtPL9+ev9yJopw2CrKaIt5sPKv1EgoJZzJG21BqVO4XIiACF3M5CU6KIj7V
fnDvbyjzSDmRvPU3xk7gubUX6pMFEn9MGERwbqsWYkvD+5r0QMVYwXTwIb2N54eDDuTl/X9+qr79
FMNwuzTKsrtVfNSeUA7SnFiIXn3xi7e2oa307x3zZt6cOvUoJVhsXClAxmd+NLTiGAec66aJrvLT
UUPVPP3nZ3GjPAkh+1XWcve7OihmZQJRb5JCmDg87hrCVM+ZaDLA79ypKEuJoosOxcIZwcdaZ+0m
MJVhT6tB6mGcq1MSRQ1k8Flq6JDl5ViMg1m8vH822RNJCX8Jjm65QqkjWKpPCOD3VYnzjBNIda9O
znN/j1aGNNBfnt3EkM757zWzPxzaa8NaYzqBydbXYBrHYjv8W2wAW9U2lSqIiJ4IKCiSTlFRGN5T
DpKeF46sKwb9wTTSHGMcEI2dXt9gl8ou5bUY0bv/q/7178TNcPdV+TiTJ7Ikw917YGVWaSzSUMXt
gq2RNm+ZASgtZNbSa01wstZVPlLxK3h8cjM+6C1aCONxkdEQyMdF86v7VDdhAYzaXEiYQ2B8KRso
K9cT1Hc+MAvQX3MZpoqfqjwxLwZJcEgPg1WmvzJx4P6AxNIRcczPqVmbzLmEoikkrbakK/T4IiQT
EK4dErXAiuu1bVE0PwG8rw6/IoAV5UjAxr2uw5AoXGXY277KRlttBFMhUcxglVoYeRXND5syzYBZ
UaRAvcMebkRHXRju9rR760gjrm7KtQP5o0tn9MEwZwobMCY/m8xXZ+Ihmr66hS9FSr0sIPh0E9hC
vmDSudhqYj3xIL+sfD02WrLxN12f1BUOpj+DHSYKOgXaLcm5KB7xzLJDAZE9tcE4RWWrs94tywqL
q5DAXddRymEW833g8/UK8ZPids0rDhngIEkLi8mgtqe6Z7keNr9O+D5c+ZFuMcB47u9Xq8CE+Nr7
3DisrcCgh7sRcTh5ux0BlzXudTvVUxFvgw0S9RLubUPK+wd2oOiauDDqYH6inb7jgq90vO+MjyqW
9k094vU8yVJqriEqT9+0XGtwfamjEj1FMs7EX/fpIzaciX28E9VvsUpEM6Om9z05cOo+TmuQsN7t
9z6F6aPWp91yZzzlXDpgVTIKTXOrwEXUbcPdxoLvg7hDPvkTvOvWlPgw4IVw34f7U53qwzXg0tRb
yaS487WO+zyN0mHnrawNoaBOk7oZK3YbPxd1qwcXaZ//enq/Y9/eP378+VUmwn3/4+mH4P0/QHUD
td+9AnfxRRwhL9/hv/oMtKA4IBmT/49yqXPJNF2KwMlcJp+qKbufIReibso1gfoCxwWY4G3ncOif
KE6Jw3v9oh4TLgVp8n1My+sD1i2L33OeRRUTukljuLwe50xPaXzChu9x0V9ov2m5B6M8hnjAZBum
TWpJQRNCbEyy7FN0iMqoj+hXwTO4u5BTj26b6SCQ8UCTKcY5B6eaQba02GxA9sonbRZNiQ9G+uyM
4/Oq38qE9ahkaIzJq+NRceiyMeAgfucF+/XdP7OXH89X8edfdqsy1qRg5K7VM0D6yrDnnBCGu7qF
rjjSqy42ZJpSMPaF59jhsUPXCkcxJCEAdU96aLEDoMrqqRMzhgisg+VQlYnL5kze5yQGOnY8R2Ss
jvRBRtXHfqFswSG9TSOHnBrF4OJIb9zaibp0Lgw8/Fzog+Ag9vg5oU+AoyN2hWgfT50OwuJ/goWl
a2uYM8iB4aU2Q/uLnL+m4uLYRHN4SVtKPFaW2ZKznoway7zQNxE/l0dIsHTCTLURJkJBBK+7ovix
EbvaeGYhoPuxYLERwFitymK/+usvotIB4/CWG6th4vJ1N02U4a8Q/2YgzHPTRMdkDqe2sDenBMK2
QcUJIB3HZQhSEjGTPC3J/ggMnCvg8BBZgVA+RQ5jRkAKjg2y3DnxgnfZ7fwNxXUCOioOgrGIEiOr
E8I42RMgO1UN+4Tiq89A271VtsgdpgViXIqZIcP2QbFW0JeTDIkJy901rGKrVto8KqeEaXY1ax0B
b1sqQ5JEnTizyNU+tA3eXgTf9PLbnx+CYRpsKyIt7i0y3RvN0v7mJ9NRDMH4kWRdJLavxkUIB2L2
gph849AooiSqlenUJAlKgMyfmKFbU//qmOqYtPUCr3O0IcqjGLR3zsgAE12b4pxoKRJJ1G+Vmbpl
RwhNriEVf9lyy5F9LL2IPjmy9SIqd6iSkURchWXrWMg6ncPGWSeBqawcjtoj0aGpoiTWpeuD7pMh
fih7VXD4HJMdY5wMIruA198cCrhOdZKyQ2JsLKaAvuJgRgL6GhZlUG9iKhMglicFLXbdLcHBUFyt
lKOQRKp4FWB2DFY3uKT+dEVXIx7WGKWLO5QRSTgbaOo8AumIpH90YWd0mLencwk2QbCEazoAnE5y
oaLy6ASHoyaP6ojmiDZizh7OYA9G1jgi6er0/pzSnOsvJAOgb5HCZob2nsPza6Sgl8qEphRwM/KS
0VPFmkbXjMY83P+FXKIUZJLkbnRaSFpal/FppNPJwLnoHVcwYKxk01lNdaYT4qIefSRB+04rPsEZ
cSV3fc4XQlaO34GHy3IPIe9ZipbLIfVdTKz+3Sd4l7lFlZ1/ZS2nvBY1IpVCDI0daW6mfXI6R1eU
rpCVzBqigZaF/oY0rdRpsLd96ulpi9Mhi/GsNwIA1UJ21PRk4sd0+MzyjQAmMWWKKzD6mmYdKkv8
So2f5smmgKJwA3RB7wFsvXKoTASCPAMYPvmywltRa4odta3xa+G6hIuouaQLAYRGMkETlZU7BNNI
x+LGEWTRoKrM9eog42nByE1YPDZYCyN+eysyKmCWRnnZkaWUUTvUMDdUgehO8DAIfdqhQy81FbwP
u83ciP82VVkVN7aXnuJOnGHdEYKglILjg1SGfWrIkdqHYbCn8lbrRV/EbaMtUZmqIRGnJDla1b3W
Ekh5Sh+/Q+hkZQWOfODEPX3SinhMwYw2YzRDUKclhzw12gaqXCf+Q14dddRDHgVd1+mA2DiTFMTJ
ygxom1/p0rI3i1qIpzc28Ay6xeLGBdfoyZmb7Wq9csws+Ka1Ka3JRGRiAqIb/GwD0Ykaclh5VIDy
QlNlyFPNtT54mlrBHEdUlQvpRfyhjzudkrkUS4joRqd4wfV4+MqCixfx3ot1j4q0ZjG6XeC7ved1
BmSt6zVQt2JQMpkRs0ZsK88wray2kIrFFpmxDdAxQg3Vs4HEfgBPrgBPrrG0/UYTo1CWT5sCK5U8
lKe3RMMtNCKmT2SxUvS9XtePRYrSOUg1GBbcIXsK6dfNznQdj2VV80f9sV10vcuPRRRTMFPnpBXV
pqczGTlZp9F62oKTIL/K0L5cZ0/aHHuoaN9fbkulV/bpb/B36gHxNlVjqBdmPiFJ6CtNXMO1O+Y5
PwBzRT13nh4Nb28AaDwSvyJ9Z54mkP4GcsdjRWgm0z4iEM9Ad6ne2xm7Ezin2WNUGN9GCSsHyKyb
GhQEAKe1XcoG4WASjCz4IPDjmoRovll765UF3YmLx2yCAIfrMPRcNQj0bvpqBqp4YMbIxkxIwBGm
HSQeDEyEzGs1m8V1Ds64uH151zpHRx0V3TV6dJIIKRBUTivPix09HBhN3JYRKPg2s0GKk3QVNjm5
4uImcOtR5Ulm0lFkKYMURUYDIexD+2sk7gNjbqI2XAUG7GEsXq93uKidIzfc0I5WwdVs9xNuJAPS
CiGoQx5KoH0Tq4fFrrKTGnhZ32wwgNs49FxLVX62DqnPwu1u6aPtHjf6wsRtx1OzpMFW4ii2vt/A
347nWrk+7nm4328KSoIrlMfhBYUylUBkrFVlo7rW+K4xcpnJL1l7iMiMngodQ3ovhu4iiZi0TzpQ
WnRkqU2NvJ8kpLggmw8F4zFEXWGF1coqBr0tPWyy/PphvfL2rl4IdLjaro3qBo3WdDCDBqv48/Xj
5fvr81/Y8HEY4744d/YIKrg073UO40Az5hLodO4UUxSQUmd6fa5j7rwpBK7vxF+/IJdki34iz3Vr
3LpGe0v87A88cWTkAGySgiFfan5kh/bXkEVdp6hKNQDGNVvXFQpuDgCrHunoRy4AwEovQON5ZWZG
6UD/PD8hkQeCDqpolPL1hvjiiuLmwq/5haMQR6J+ZxehEXsMkbe0vwGmKRx6B51qvMgdrXWoGSPW
GL/6mLsa6+KdTZqG6/5A4P+PM18pyOT3SpQ4UNR5Z5aDOfQBFuuCeNoU+HRTEIg1Qmb8GtAyEBC4
08JTT4ljLIt2DGSUnlywaXalpWBaxBlufzUXquS22xSQmqptyOjOVcPKKq6w1Vy9WcPDM5LtAWYR
4Sg9AmBEKBtAU7DBwd6M2OEwtJs1vSMGRkhjl9khbdoIDdcIM82MTLQ+0xMQR72cwbg3E9z1yDwR
DAH5TDDknIY1u4AyowDYBEakueIKeekcrkvXPKTUn2hw04RF6MAp2t125Z0xwIitKUE43qwE4YsY
IHhoAfTXyu8Ryz4C7Y/F/0shphLU1vpU4DMaGgmiDfEFxqfL8FMTYAzFKjAovA1Zkrcx6LYyvJwc
EfKDbXA2AXh896pIvYN736M6iGZ4ZPzRqcxyUO2sZGvoq2GicEjAeh1NZL7e0GS2Yo6i0iNbiR/9
Hj/WA2gpbiXgzW5pKLTMABBX+FFJb4sjuI9O4ghnopN8ekwiuq06lRTEU7HiqQNSneRN9Ihv1wF+
zYMNaRk1Bdw8XTlmhkcepYGcVrIdZANlRkw4Y+jmu74qOlE2/Wg6vLP1jjtLtGtt2jPqWhchfBhO
ZTNOD6E3S+g8QY1Uppjfvv/54TQMZWV9xrnBAGCFU0XILIOkp/kYPwPhVG7Ve9pJWJEUUduw7l45
1kxe7q9Pghd/+fbx/OP3J+RUMXwEBphiQDQFBoJDoMNz58RyISWmZd/94q389TLN4y+7bWh269fq
kQ6JqtDphWhaelH3mzYLLi9T9cF9+niojAjYI0wwxzQjrxHUm43jTQoTheHfIaLkwpmkvT/Q7Xxo
vdXmRiuAZneTxve2N2iSIWdCsw3pGPQTZX4v2rtMYkqiNIXMAOB45pkI2zjarj3al0knCtfejalQ
e+VG34ow8OkDCNEEN2iKqNsFm/0Nopg+y2aCuvFwmCmbpkyvrUMxMdFAMg3gxG5UN7xM3SBqq2t0
jWhBd6Y6lzcXCXvgW//GfFTiZKPdZ7S5D8QGu1FOW/h9W53jkyv960TZtTcbHkc1aC+XiQ4x/Wgw
T25739eCy3Kf7XCYIsYNAOJwpkxdFW6KHGN8o9LbQf+dn4Lqfb/TNVQSHD9GdWQCU2A/sEYNwU2/
GAPLCzoWnSK78K7rIqvOwXfdKJM/llEtFbKuUMEmHS3oTTcTJCXVpJoR0kdllFdHChEkFFR/dNag
SDKc4HF1aOhHrYnkmPkUAzzjG123hsA9DrM1485MHL9FRfNME5nUrETxDSrOkvQKiZAoTdxE1Rbk
uDBpIuFEYN7bRPqBTyCvUdMwbPM94YroKG1vlloqeK84rRqqXok6RLpqYcZBcnldtTp3/coS8YPA
fDql5ekcEZjksKfmNCrSWJcC5zrOzaE6NlHWUYuPC17fIxDAj50LavV0dUQtbgD3WebCYAFfm5H8
XiwkwaxQjai5/BZ55RJIutq6a6hllXEWbZHaQ21zmUbXkbZbEcBJqVjYBSrwUaOExYKtDb2HBOH4
awDB0dckpDgYkEx35x0h8pyvDLifDL6JJr0+6QPENyHByoKsLUhkQjabkSU/Pf34IgP+sZ+rO5CK
kCc3aizh+m5QyJ89C1dr3wSKv7EptQLHbejHOw9Z9iiMEKGM+xyjYybuU7O4nB0IqHIJMsofTPKN
S9lsBPcLIyo0LqSJe6LCqB6aYRSneGeSDTgbQwlnBR6wEdKXXAgmeuETJqc5rgmfFmdvdU/pDSaS
rAgHL/fhWYhaIJNfISVVK0feP55+PH3+gJi2ZnyAtkUvnBdqdM8l6/ZhX7e6cYtyqXYCxdY9l+0v
/maKbpHLYK7gWjDY3g9xpH68PL3ab2KKBevTqMkf0Sk9IEIfe91PwD5J6yaVke/GgG40nQrRgNbE
iPK2m80q6i+RAJUtze7r9Blc7hRfoRPFyh3Q0egicrQShRzREGkXNa72OwQinaRISyE4UTycTlU2
Mi0E/2VNYRsxw6xIJxKyorRrU8HP0LKAThjxOhVzdnEkVEGjdVVKabKchI73jRre+mFIeploRHnN
HSunYAlROUR2JFwFVBSPt28/wacCIpe7dI0ngh0MRQmxN3AFZ0cktPA0kMBA5qylNNQDBb5eNaC2
WM1Sf+W0QDagOcuYw8N2oMjB4OlhsYw4LjvaY2Ci8LaM7xzC40AkRLFtsEwyXDu/ttHRmf4Ek94i
G0xEan6T0uXzNaCb2n0VCnTGxUjWt+qQVKzM8rS7RRqDraiMK8yOLBZnNO0qOi4/cXx88gJaxTVO
Ut0Yu34KQIfOfGP9FXHb5JacOiBVfPEyicyiB7KyPzrWZ1l9qlym8+c8dxodyDi7YlmT7jFDq0BV
iyx3NLjsjSjcjEEkQPDwWrb0w41EOewxlGIXPRLIRy3L3Xzks+uCCSaxTHLDJx/gNcRyUaF5XZ8q
SyUlwWYRdvKQBGTqVIXhTHdVAdAV8j4nuhJAtQM884x8IAJxsGqnbACugqssE93vcQLJ8PGCmStS
Emv488yIqEgo8CFaBx6FuOi+CjrYzI4242KxNkiLrZmkY/VJHDsa21/XOVMenoNdETxB3X0mOLx5
7zyWsVRLk27sELcfUgmvDd+lGb523ERx46/p45XVY6JI8gBwNlrTN10jxzUi1oOYS6IjAnGPZrm8
NNhJXlCYSRLnaakdsqzYOMf4lIJeAFYSUXEbiz91QU9yS2Yokp8wbse9UvCFLwyzCA3cx43jlWMk
Aq3h3yKybJYIGrCIKJETto4tz5eqxR5tgC5JWR8wskqTfKzD2eC4oVhYwFzEwEMsw+7RbiBvg+BT
7a/dGKxmsLDmJKR5DEG5iaYIfiB/RHfDCJH5WfRSJkRFJ1qzpbj523GxNWfe9hDXW2UVsF9e/Zh4
cPWR53wtc8kJ4alJjyjiDkCl0h3iRKJzGtZVVdQReYUA8iS+Qs+RAqhsMJXJ5mytKZso499S7RRc
00EJ7qLIPE/LY2oVavEOM1z8TZ9XA0XexutgRUX4GinqONpv1p5dqUL8RSBYCTyAjVDWoRowSTG9
1bwi7+I6p5mqxSHERalsFFIUd/RUPi2MkwOlRWMC1HdjOvJjdWAt7gcA6zijgJGuzDAKniqblByQ
XGBeBcN9dycaJ+B/vL1/LCb8UZUybxNszLGU4G3g6LzEdoH1UZHsyNjRAzL0sJ3oAO6LmtIwyRM0
XBkLifH4ZEKK1iy1ZqyjfN7luSu1+T4uZAD2fL0PNwZKelmKrXHGcM74ZrO3Rk6AtwHldDMg99vO
/MRwNMKYupnyusskakS6MllyjFn3+Sz77/vH89e73/6cU/j+86tYGa//vXv++tvzly/PX+5+Hqh+
EkI4xDH/F14jMRy5OKSz2oyQ7VlGfjMvaQPN84j0QjfIqPDQBskhehTiBiOD3hmFYd8xwKZFenGt
NOpElKeosgxVqRcrircByvu0EKcOHp5KPoRjmNjehBsgYJp7PV+7WisFiiQDsCmfnAoJ+Ze46r4J
OVGgflZ7/unL0/cPOqmdHB9WwdvomQxaKgny0tgZVrRY2drqULXZ+dOnvuI4VTFg2wi8GS8UVyfR
rBzDYMr2VR9/qBN56IO2VM32E8e7hs1w0nfnQWnsnPZMPtQCCtatMSu5zFYqDYWtrS9x4AUKYYKd
16gKQgmr4wYJXAg3SFxJZ3QuRvsuoObdYNWUQTRtQQw4lYxEk+QBlk7iFphjFk/vsAjj+e5J7PmU
WX2kyshRUdTJBL9WQjKADb48ZrsP5xZk4NzhHQESgB1l3saCqWNiRbmeDxdruK6gnnaUCZkYzajY
AjZkP8LliN3nKCXjRhHg3QZaK6uZll5IwPJit+rznPQNkYXn2Ih5BFqFK9Vkz3lsVlGpje2ooe4i
X/fon2H24Ix+cxjKYy8UV+vKN8BSm2o2BtISOFrSgWmzSW976GrIT4/lQ1H3xwdrNJQGZF72GoNp
B/OEZs38PNCPsa2H/fKOicUfQ40lJ6CqakiQ68rrBTRtnm79bmUMFD7LJpCU2Sm4iicFSrO20dNA
y4U6hTDXGufQHZ44Da9rIq9UW999fn37/D+U6l8ge28Thr0lSc5qE+v7SSdoyhhjhrMBAYmxz7We
65eVhW6bqtGDoJGdxWf46QxKEv+jq0AIdXZbTRqbEnW1v9rrgzthCuruG7FFXPsBX4VYXLWwaBmb
WBvDWXnUH+UmeOdt9CjdE7wtso5qfB3lBRnOYiRo7sPVhvqyitPcYT00tX9yH+ZOm9CRlmIiLaL4
lDbN44WljuS4A1n+KA5iOxerOW95AnH57x1Jlsd2NVXnMrGcmhWVZVXeLCpOkwgyOztU5wOVuOwu
aXOryjS/P8FD2a06U3GltfxwbmjDzmmjyWBeN0tjYs5v0fwKL6K3xxUIMpaaagGTKr2y263n57Jh
PL095S072k1T2X2evz2/P73ffX/59vnjxysVxdJFYu4YcRCeyugYNcSGBu1WZMNjvt7l3saBCF2I
/cpGpA9ncW8eGuQdDbsP8RIDQOblqKP2NCTu2Hj+SFFlhnQpBa8hx4NRCmseTF8hdZo6fJJlUeIq
y7hRfGxcrhOwv5AGJ4Cew7EonZzK8fL16ft3IUTLBlg6Fvndbt11FsOnOmkxwAa+SGp6nan2OrlZ
iU6uUX2w6gS7CNcXWQv/rLyVMVrTVUaI6IqgWZqAU35NrE8YaSQsUTIg1CU2GlEcwi3fdSY0LT95
/s4qnkdFtEl8sVqrAxU1TxFZ7OMArihucFxMsa7zlcBLF242BsxO/j5OaZ858hgtrCjFHwmW5qcB
C/ZNxprDFXmrNQj8/Tp0LhAgkRErva3R+AEjPjYQ2c4LQ3MO1ETYq4K14c45jroib4QEnmeP2JWV
EIPdvQ2u3NvG65Ac0sUhm7RkEvr81/enb1/s7Tv435jnk4IOyVyMOU5KR5x0OVpCInRcRmogwaeD
DNwzo317mAY4NMj1qVTBB+bsDVCclmbG7MzDoI6zcGPtw7ZmsR8OppGaGsIYWnVyZsnfGHLfrDiS
sbAjq+eHRCxKP3Qeg9F+Ze1OrOmSoEmLh0vP62C/plThAzbcWSNqXr5q2CT/axVPuJXgYeXbzSo0
96cEh1t7FUjE3qNNYxTFQ9GFtJ+T2k1FGHj0K9CE3zhXp8Du9yiLCzHZw0MFu7EI7CcDNd1t6DBa
UoMvmEcyZ9+weJl25OEv4b1RIX3q9UDSNEkc+J454byCeE15jtLCER2cZP/Fjgt+wduuqQ0eePul
qVEnB+3IpQjiIAhD5+TVjFe8Me+xJvLWunW4KmnMjT0bLdndUo6i/GB3d/qKwEr05eXHx59Pr0ts
VXQ8NukxQmm0h7bF9+dabxtZ2vjNFUcv8UDnYXHt3k//eRn0yJa6RnyitKLS9a/SFseMSbi/1plo
jAl9owkTzruSEU8mCsw5z3B+RMpwovl6t/jr0/8+4x4N2iEI32G0bdAP0TYmEx66hcV5jKKdKBGN
Rzs/4nKoB0dE4QdofCaEUjZQXwQrZ7MDSjjAFIH746CPG0oxialCullI26IjduHKhTBX9tz5dEUd
cZjE2xFLaFgqmsQrI8Y3KScjcyssP9d1juzodfhC5mJEJuO5UnVARD0gtHVvURL3hwheBTQrF3XD
9aBHPeOwEwohy6JGR958ZlWgiTVhYM4B0RKBj1lttTfsoS1Cum3D/XqDeJkRFwu2i1LVT/irv/I2
1Jcw51vqdNcJ9NWC4J6rSDLT3kjAD9zutwLOtmoy4rEEL5R0ePB3KO6vgcB6TRN5Sh6o9o/opO3P
Yp2IyepL8mlymjLQvhKNMOHqtznxABVCQXZO8/4YnY8p1SZxTXs7l9GgQUQzcojId7AEY48Yr6Gk
hT6LYsK9fsWPCOBupWxNwEPk1DNiHGqAuSa5EogS22C78agSweTI2/rUm7/Wfm+92RENTdJWPtwr
ku1ma5MA07Tb7oney2HZ76hGKRR9h000tb/1qYgMI4FYm2tv01HlSxQZAFyn8Ddk4wC1c5ieazQb
UfdyBUIwWTkq2OxDev3qNFsyWcB0SBSHYE3MmRJ56Jolzvd2i7tCbjxYN/5+Td3XY2FNK47gDVXN
OebeakUde1P3kv1+r4cEa8pNu/VC80AwYpDLn/0F+8co4GAXYITWV94xTx+CZaV8wIacqcku8LS2
aPC1E46274wpvJVPDRqm2FCFAmLrLpWOUoFoSPZKp/B2O0cFe39NbZeZot11puPmjAq8Wx+vvRXV
Z0B4DsTWdyDIvLcSsSEbeGqXm8cDskQe77a+R5bYQaLscnzdXZyY+xDyCi3PXZFAKoPm6DC8mFL7
1nlq5Hq32nzAId0nOPi+kV1pu3pp1cTir4g1gqtCwdwNbM3PVOEJ3/pLIw95iH1i+hOIjMyLgsAY
yqgRzjb3kCiOagSoXFcbKp+IThH62ZH+ehPsNi5/R0VzJI3OR2wRe8EuDHCsial4Hp90R5AJ3gox
9NwCw2Ujj/nGCzkxOgLhr0iE4GsjqnsCQdrMjGhlw1dSn57YaesFLifCYVoORZS6/PkmkjqlfSUH
AngBwdfAPOubFXkmgXmYue3Mb9twZ5f4a7z2qQLFtdR4/uJizlmZRsfULpN4ZpxQ8pIl1rNCEA0c
EJiZN5HY1EZH7onDQSHIbkvmcbN0PgCF79E9WPs+cYRLxJo8qSXKEQEL0yw1CXhVj7pVAOGTFyBg
tqstleEbkXh7utTtlmQHALWnmS2NJBAyiMsXUyci7aI1ki15lkpEsHc0b7tdL+1/SbEht5hE7an3
KdxqasUVcR2sqMa28XazpmoTjKsfhFtaNzsVm5aZ7x2K2FZ12LTNTpyV1LvEzFHEyOZuXH/FNiDX
buEI76YR0Ao5jWBpAQo0dR4Uu5CChtRGL8KAhFLbt6COx7zYk4tBwJdXsCBYGmuB3vgBwWpLxJpY
KQpBNLyOw12wJXoPiDW9/cs2VqpaxlunX/JAGrdisy/1BSh2O6JlArELV+Q5C6j9io7nMdHUMr/G
Qs3yZXGvDVZdGF7DAx0NBgHB324dCJq3PkCiiowOATDd732cZTVRISt5fW56VvOaU4WzJtj4i9KU
oBji9RMf13yzdrzmTEQ834aCPbuxdv3NakspytENSu5DhQBXrHM+PLVQN1oQejfvHpSXAF8+K/rc
91e7gDp9JWZDfyNObOo4AMx6vXbdBOHWEWBzoqnFOCx1sS62u+26JXikukvFxUvW/LBZ81+9VRgt
3WHi6liv1hQnIjCbYLsj7vRznOxXlCAFCJ9CdEmdej65uT/lW4+0R5h6eC0GJttA8EPLCU6OC4GW
mCMBpu5UAQ7+otolEPHS5ppdtEwhrEgFN0JcD6mQddBbp4bwPQdiC/p4sn0Fj9e7YnkHj0T7pSWg
iA7BnmizEMBA0WbF7EZ43/VhQByXvG05ub2ERCu4Kep8jT0/TEKXTonvaPMMRLGj1ChidENqTbAy
MmykdcziJSMIAp9Wi7TxbvkKa09FTNo+TARF7dE3pMQsXbuSgBxAgbl1DwDJ4kUjCDYeyfddWNTH
9fmGtCmotuE2smfi0npG/o8ZE/rBcrOvYbDbBfTTn04TenRotZli75HaIYnyXbGVNJqlmZEEJPeg
MHD2gUXschG5uJdagolQqG1Jam8EUuzd05LyR5Gkp4z83m3Mo5M4Ih7MWwZyfRTeqidlk0Xv1Gkr
g9u89bJKqPPuVx6p7ZT8LQ46O4AgtrozwP9Iw9uoZRCvkYwdMRClRdoc0xIitA3RVkCVFz32Bf9l
ZRJbGYlHREWnG1fIa8NkXEjIqKfzlCN+TEZyrC6QGqzurwxH56UIM9Bh8lPk8CmkPoEIfirE6OIn
7tIJQr29BBpc9nrTb08noNs0ECbpJWvSB20dWJMHLCqj5wTMr601y759PL/egf/p16dX0ulULnxe
xX3S8rEseukL0mC96m6UBiRUOZOVxWJZ/wc1q45PaFNMUQ6pTmkjwmSHyEYMJLr1BEE3UNlxikaI
5RA+IcrqGj1WZ8pSZKJRgZhkkI4+LWGvJEQVEGtcOq+J0sTetKuSVv/WXF2fPj7/8eXt33f1j+eP
l6/Pb39+3B3fxBB9e8OTNZVTN+lQDaxRd4GuPAG8ylpirNRDAIFQZpTLYBXcFNI4xSg+8KxA0gqY
zTDS8tNqu59wtHVVEonmJuQMKfMYYt6VYYyNGIK92YhPjDVgZ2RjRh9cYsSuZK/Gh1eqV2PHow4C
3dGfp+15eUR4C+HTvWWiKH44syZ1jFyUXCB5ipgzgZ97FOWsgPAbA3QuTMB33spzlJYe4l5I3Gtc
mHwmClMM5ILrW60EY6u/fYnPM9bWsU8OSHpuqrGpZFfZYSeKpJsG7yW6Bek1ysSRjprEtsFqlfKD
2WmWghTjKFZ0wCgFIFPy4tqIUdAKacLPrBoE2FHBqSbH4lQL8r6UId7iKmFkMDJlN26MuxCI1CBp
yizQ33kBBpaXYXKmOrcr5zAINn1j1APpRAfHCbO7gAt2h53d6fkukLbgjtpAMECVjcyoWZGAh7td
5jo1QiG27jJcFCST/2R0RSzLtBZybEBFwFMcaMrMuku2h2Surg6WLN6t4HBw4CFMY+RbG200UP/p
t6f35y/zGR8//fiC8lKyOiaOw6RVXu2j/fONYgQFVQwXe6SuOGcHFBRXj1EPJHyIRaF/FTPIHEh/
PWL/H2NP0uU2zuNf8ZvD3OZ9WixLnnk5yJIss60touQlF73qxEnXm0oqU0kO8+8HoCSLC+iaQ7rL
ALhTIEBi0YEYcU4vtewlhYTSRqbUYQ/andEqdExCiZ0ScVXpoioRiVMNoXdJGZMDQYSx0sJz/+uf
H59/P7/+sGYhLfepnmcOIJIlpwzlfqhqxTPUo+558IAxnV5EkbjzotAxJCqBw4hwIgqELXP4QnUo
EksyIqQRSTkci1eFIEi3QeiWZyqdkmhEs45cYFr+jn26eMcoLYxQe3qNhUTL+Cavzt25VSknwD51
eXvHylfGd6D6VLSA6ZcisYYo1fn2aRRCn2fNWSeRMDJGz53AGCNCN3TH7mj69W5Cu+S9lkAqrlII
yeMuO9ftUViOaIubuL5ixCsB9VAzMso+3tGMUi93YJs18G1LYptDh5GLOEukG1uEQStKoCasaTxa
PvZxeyRDQRVNYvFVRczoxkgojHrPLCRDcujO/19CVMdse3+knmJyK1O1YMQlzLvl9dhZC7YBxWJ3
odi/TNNp8yvSL+kV/hVXn4akrOlEiEihB9VCWBQ1ZeQ4FND4IgR441BXwSMzudsMa0wGzYEtOdkW
AuvXMqJlh70FuvXJ1qK1/cscTbPp97073rPxtsWC2QBGGrDbKI/OM8woPGuYisrwSYR3pO6PBddE
nD7yE2uyVgTLtJRCxUwv1CT7APgYdVkrityd85RSbRc4lkRqAp0EXUC+iAvsMXK0uZo0ThXIs4SQ
Djhbh5sLhSgD+dHzDtLkGAE/XiPYqsqrQry7BI5jjyImynVlQ6aXRZzmxY6wDiMa+X5wGTqeKMZ+
iB3dYHWY7gYw1VOUlMu9WMHZC3bWQBq+cR3VCH40AKcvgQUq1M4X00l2gW4dAuq5xneP8Ggd2j5r
HNTs6muMFhDBhra3l5qkXsDuaM2X9w7fktMgoT1ieAA1UqPJuEfyBxABh7W823TnYu34D/YdEGyc
tUkgNXAuXC/0iU+iKP3A13bY5B2tAYXWqsK0CAyiPtNsUYildy9yE2gKqzOCEF2EMOjRD4ZioGXg
kj4EM9I15EvhPU2ZpN2RxtcG0DX5OD8hfVebvekWzxjpBFdML2d44FAwso7R+1vmlvWhHF30LyZn
nnAg8dq+jqW4p3Pc8V5OB2rhp8Q1I28e7UjleeuDdJX+UC+cayBNY+5AayzFhWLPLpjWpS46xfp2
IcAQ+f2YgYL3pexdstDg04l4OXlIBTJRrnEaBYnC1cO+orYbySYAKkpVhCVcGvjq1pVwo4b7uFlD
nZZwQs0kv8KFiAgRYaMijQcWmlmYMRdas+xXMK5sxKBgPJULaDjqSV/aOXEV+AHdqMBFkaVyi5ve
QsB4sfUdsma0OfNCl1xogudKSBAhQssqChytv8pEUeg9Xh7zkFZxAX1Mq0QRxYwkkvFUsjQCyE1I
GdstNKa/oooLog1dubBUW1M+hRqNLMqrqG3gWVFbW49UfUFBzcoO3Vuh9Lwz46MO5Ly3+COZ987M
TtcJ+nWZShGS0r5KE6kOBTKycUGupA52iagJ1nJQJRkTRcHWhtlcaMzHcOvRSwo6mkvyFsTIsQ9U
TECv56wFUuMW2uA7i2QGeaSIkhgOClrDlqj20eWd06jZ958yxV9Mwp2A+dnGIpAWB1aNinTClWjO
JdV6G/NmhxEkMR7rkuVziDuMkkuWUPVMCXHXNokutt06spiGyUTlifT8WUi4VzaxQ+4jRHF6i/Gg
jMJNSHdtVlsft1vk+EBJruAi31G1Q+XOhgq6rNBE3tpyGAhkSIWTWGjQvtbd+BZGMKuu71Wx8Xya
HY8KKv2NmoqujotI9mIqvRrOfTQc3bXaQrS2d8vCwSRllWj6pFvPETSmJRtJEli++FEzoYon5mGR
wGFDXWYVTM7/u2v2AjKUdZp5WgXivRhEcnpUyZS0i0w3ZV4kZZiBAuFy8wvUeP8WVRxCXzXn7vEN
ry94FiEB2TEkaWNW8UOc1mcr2dj01Kzxmpa/Pf385/nzLzMIdpxLkjP80JOLIYgz5QIbQZYEGUJr
yzvlOfiUx5gBh+w14viZdRjat6ak31TOygA/hpJhsOsdo6Bcg6bNEPcXM5GPwAnX/rKkoDwr9hhC
RsUdSz5loaHKQFslx/TRTV3U+RW2+V6ZNKTc7zCY6d0mjh7ugFmQBljNFLTQtpyC26ujSuQsFAjr
Om0gmEWM7C1QkvAcA4uXMYnDkdtwWI4fyoyulcPC3gOy43vS7cfn1y+3t9Xr2+qf28tP+AuzmyhW
XlhuzL8UOmQoqZmAs8KV/VdmOMbh70BV20YXfQUUtC7uSBESbd0cbQvbkspYJ2aqhu8wJquVS8k9
buNUSUi2wMQFQtO1+iDiMs0b6jIXkVXdn7JYuaWfQHOi46S7UHxCIxa7+kNAgmej1Q8+jS5Lsv0p
xnrPDyQvkHov4kAVmCfctvxb2VllhgwiZRAmUNtlH/7t37SlR4Ikbrq+zQYQA8nMMXdCy9QLXH4y
GeyXt+//egbkKr39/efbt+cf3xYWey94Fs2SddqupFQCI2Kxhs7pHIMzET8Pe2HIN1LXO8ygw4l5
vBOOOQTTOCeIpib7hKpg4aBmXws4xorsBCeFyFMqAnfTh7LW1mlXxNVxyE7webw/V3Om5ynJ4fQZ
EgulLmDz9vr1+eW2yv88YyKm+ufv5+/Pv57wupFY0nGaZptXFJsdci+NRt6YvYz3vMmq9IMXmJSH
LG67XRZ3Y+bQU1wgmUnXgOJSNt293c3apAHdHA6hjz2GQtv1/HqOWfchovrH4dCSh2AQII4XmNA0
7dvRnNslZvTRzClnU57ppxWcMBqkPOf7CwWDUzTR+WVexlrQhgm6IbVVRPZpodYRm7u1zOPcs6S0
Fmw6iVs0gT2klkQbd6LilNp3+McLLWgjbleDnmoZwpRDV0mDhvAmroQEJ/Z1+vzr58vT/66apx+3
l1/qDhaEQ7zrhqvjO5eLswljfQ4mGmwORGdYfDJbr0QJ+3v45DiwOcugCYaq84NguyF6CGPLhgPD
qywv3KY2iu7kOu65h7Oh2NCdA7kPxJOHvcL5pwtzVjbvDCkrWBoPx9QPOld+DFso9hm7sGo4on0w
K71dLOfEUciu6G+xvzqh461T5m1i3yFHzjAJ+hH+t/U9sq47AdtGkZuQJFVVF5ic0Qm3nxLLyv6V
sqHooD9l5sA3ZN/sI/kRtJCYDx13SGsLiZBVecp4g546x9TZhqmzpjpZZHGKAym6I1R58N315vwO
HXTzkLqRt6XoeFzyHua4SLfO2iFrAuTO8YOP9CIhOl8HIbnQFWhxVRE56+hQqI8fEk19irGnYue7
702oRL3ZhB6lVZHEW8clP6oS00Fh1s147wThOQssvawLYOqXoUhS/LPqYf/SKVqkIphmQ5ih1x2+
Sm3pLAlSAZ7iP/gqOi+IwiHwOxsvGwvAf2NeY27v0+niOnvHX1cOuYiWyzya9Joy4B9tuQndrWU6
JKLIsx4aE21d7eqh3cFHk/pk7+ZNyDepu0nfIcn8Q+xZmNNCtPH/ci6ks6qFvHyvWSRRn5btZIZq
bZBFUeyAZsLXgZft5VtLmjqOjeNaI6r3UM/jheAZO9bD2j+f9m5OtgiafzMUH2EHti6/OJbFn8i4
44enMD071AsfQb32O7fILGNlHWwT+BB5F4bWdhWid9ZWpo22J0uNdYWBbC9rbx0fqesykzTYBPGx
pMbQpfXQFbDLz/xA7/OuAYrU8aIO2IJlkBPN2i+7LKavxTXiJqe9TSWyti+uk2gRDuePlzymundi
HGTV+oJf9dbbkucF8D0Qx/Ph0jROECRe6MnagiY9ycV3LUvzjKryjlEEMPQBfPv69Pm22r09f/lm
3h0kaYXR6yhjUIE+wPrj9Rrei6gRrcWt0HTWAqgy8qIqlAVUg6yu6LYb174gKll/oa8dBSUIVwNe
rVJmv0KOxouHA2swjEHaXPAxMM+GXRQ4J3/Ya8d9dS7k6zz1euDSDE1X+WsyovK4Anh3MjQ82phy
0x21NpgPZ/iJschmZTrSsK3j0WYNM97zqQvtEYuCJrltugOrMK57svFhLl3H0yQlUBoPbBePllfh
xnuIfVw2fIiN9GlR8SH9UC8I4RjeN2vrd4sertUmgDWNNLEFSzap63FHv9IBYQCzDl3gj8vGXz/A
htHlYsGmzYNiG0+/RcL81+kpDEzhTkLpl/D6R1we0iYK1huKk5hsQC6edVV8YgZzn8APHH/F0Nqk
yXu9bHnhe/ryXfSXtS0obB8z1TpU06Ndr/ctHwa+nSLR4RL5QUhHdZhpUFnxSMNomcKXQ3PJiLW8
dWZEyeD48T8quvuMa7MmbizBDWYaOE4DS+oViST0A9t14WlXX04szYx7ufG61VIqu+D9K15YimD1
nDpHQN7Oqk7ctwzoyXrUqDD5WhtXaX3P9Lt/e/p+W/395+tXTPB7v6Keyux3oCanhZK5F2BV3bH9
VQZJf08vEOI9QimVysbI8Fu4hp8yHptPX9gu/NuzomjhaDIQSd1coY3YQLAyzrMdKLoKhl85XRci
yLoQIdd1XybsVd1mLK+GrEpZTD3JzC3WcmQInIBsD/pHlg6ybTjAD1nS77T2T3msJODD+ZpvuBUo
PltODylqa3jvgr2HPZmTq/3PnFbb8JHDyRRfuTbypqTsAJD6CpqV56gXajIcF58uGrfqrojhXIVp
VQfJSt7pywAz5NJfISB73Fd0g4hRd/NaZd24IjmtqAIKIxaIpPA2Au6mwnqJbr2CD59p7QuQaoa7
gMdXFQJBb4eWnWIDoJuRz2B7xo6Z4tGrCq5LKF+YAKDIIieQQ9DhJohb+PZqZDxytjjcu1qinTsI
eHRRZJWSk1JCXnnHPvaZNqQJS72JLFhiJsTLmWVzdlfXi7QCI5CeGo3OukdoazrExCfgOhamwvQP
EiADnWRuRqp+lLj9mXVrV1kNLI/RYjvgj9eWenAHjJ/u1WVEAKiKSVZozQsE7SaInavrtK5dpapT
ByK2r7I2kIizSmcIsSVRrmBc1gmH3VnC+WaZwsm/R5nzkif93vJ5K28E+IHsQBi6dOvAYI2TObit
W2WGyntdWjqGWTSVXOwLTCRHy1N9m89Ym2uu2DCWi23EceBqTqg0yMvQVXRfUpgQB8/u6fN/vzx/
++f36t9XRZLOVviGbQleLiZFzPlkWrO0h5hivXdA1fE6OYafQJQcRLp8L5s6C3h38gPn40mFjkKl
8tI/g33Swg6xXVp761Ivc8pzb+17MaXCIZ5KtYrwuOT+ZrvPSWuFaUSw9Y57x9eLjmKzpVjdlT7I
y9IRcGdTlnld8Mcu9QKfwug+PVKdNG9fCEbLyvsAFoRII0CMYqH4mNTlcFbiBi1IHh/ilhym7i0j
NXl3zaf6k6Lhri2bj0JFujlINKMrhGUiN75DdlugtnTfCtANSQtFhSSUs5tKM7U4Hho4yo1OGojw
13hnRiw+CFLPTjDnYdHQbezSjetQu1nqRptckqoiJ23KJjHxn3e4zFweJEeMIyd9BEIboyVpfKmV
2Eed1+qvQTyFgBheqf7mC8oQVE2SpOg7z1MSbhr2d3MxXveVGiVRzaor+O2BpSZzPWgJa1i65P/q
2qzKO8o/HsjaWLpx64lqplBjRjf4z9vn56cX0R1Dy8CC8Rpfh6TZRliS9OKBRm8lTtqevksTWAtD
ueNYa1TIe1qMF8gelELq4kTMW1YcWWXMZoZ2Efu9tc4dy3dZ9YgCzRpb6gpgRDL4ddWbndKf2ArV
veLJg7AyxohjVxWYCINQo/LGc11K7RNImKKOoWvezgnUK1KBvjagKNmnGDZWXlf4RmglyUquTZeM
LORwxSMkS+Q4OiOs1juWfTpmtknOs3LHWnOL71vKYECgirpltRzLHKGHuuiyowQTv2Ewes0nULSK
lLrEF5V3m8jXlg86P38gMvSaqYA+ESnYVeA5LmCTqrATy87iEdUY9LU17E4VApbQhlUC12n9+Sve
tcb+6s6sOpDXKONIK86AMdXaOheJnqELgbKoMAKq+lRrMJiSieco/ZjhQ/qXpS93CvjRSDN4h4ul
lYBtX+6KrIlTz0Dl27VjAM+HLCu4Ah4/VljEEvZXpsML1BF04HUPcp4xvDYbPzbL2EqWtDXGONTL
lfiC1Fo/lrIvOkbsxapjOqBluQqqW/X7YBhXoMILa/ielO9PAtuZQZNVMEmVMYIm6+LiWtkPjgaY
KkoLlmqBx4h31IQbNRfxlXePP5CmRXMlK7pFNc/6BbV1ksTGgIDXw8RZq5yewy1V8lp2XBIvuvp+
E0m6MBKv0XCXxXSEqgkLuxfEAMvVmKDpq6boKYsOMdxS2zQ5GmjEXL4vu4MIRsrLuO3+qq96Eyq/
YSdKXhWouuGZzkPwpS0vdVjb827M0Sx3QoY/OuR7lKiGhlPv9wLv7T9lrca4zvF4sik1nRkr6862
fy4MPgm1FqwX50euaIY96vKnawril5V/jIGfh0O/0/bSCE9gWkCZG38ZUljR2HZECdLHHOV9TlBO
iJT3DOWk2IvuMAemLWujCrETDSjH6gxI+c3luu/OCWqD9+rw5W+UWC0xOmaCmp7xBT3kdZ2yC9kr
vQNSNGTGD/RkjP42gFanZAHf32/S+lyhY8m0xZW4xHr1o5NDma74fkRww2mohM2wn1tdXByoMjNS
aUFaqPqQsAFfNopseoSRtBMMUag/JyHwnlhBWXMQGfA2keKWiO6Lhg1KlpqxqqrSIvwgWETzPcR8
OCSpglHJtLhcomRVwcmVZEOVnSmfsjG84fOvz7eXl6cft9c/v8SOfP2JhtKKVQjWNscHRz2WkWEe
kWoPTWHoYXEEsUwbYnqtYgxXVrKqbjVc3eUGAD0o0j7pCsY7E5kyLoKlZxdgjBUGXe93JtWel8Ty
cLE+Ip0r31k8UMQcLobyY7T3D56MHtd+YRSvv36vktcfv99eX17wslJXTsU6b8KL4xjLOVxw/41Q
pbcCnu5yOobWnWLcAAQUlqLKeMwp7HKPKKGypSM6tMXHVZjmoesIbNfhVptdrXSs0UEB3fOCbp28
5BSLeuk91zk0SGSZEMxq7W4u5iD2sCOgMDXNIgmQ5z6otbYsUH3vcUKzZYWI89079VuWpbc037u+
96DXvIhc15yJOxgmq6ZQqmAqnD+jeLNBOzd7Y9MA1foQiLYF4lFZ/lymqOjJy9OvX1RMfPEBJrRs
KHheK7xTLH05p9oEdiKAz5g0GaSb/1yJwXZ1i09jX24/4Xz4tXr9seIJZ6u///xe7Yoj8s2Bp6vv
TzAZY9mnl1+vq79vqx+325fbl/+CZm9KTYfby8/V19e31ffXt9vq+cfX17kkjpl9f0JfH8lvT96D
aaJEMAQYawwX5BF6mraDbXaAxBKOd0TOL8DKjAqrIcInT/1SxKKmLfXaJrj8OfH1ihEmzr0HZYYp
APAYYPnl6TdM4vdV/vJnDpxvnv/3ogZzGSuMG/0EQjDIP+OjlIHzTIjSq/zpy7fb73+lf55e/gN4
/A3W+Mtt9Xb7nz/Pb7fx+BxJZglj9VvslduPp79fbl+MMxXr17iGjibXSWBOGCPRcsl1J0LPtiMc
uJxnqKbtaRVGbQ3PeAbyoW2B0YSSpbJtiwydJ0zdWDPSPto7SclLS82svFgrJi6LKbIuy1ut43ha
hBuHBJqM847AYNZtXSgcTSy5hZP1nIcW2zXBPqD3RP4QrFWV0SzVZyUjsx1POG+jDiNO+66/aIw/
O/FMk8KKLK+76VJMFaKsh8B0Pwv/D5ONry3lVZgO6pWxVNxE2YTKLmXzrax6OOAF/GRwTE6sIBjK
PWY05x3635NWEGLwDOS83SmPjYFaWSx+XCBfn9iujTvSjVeMrQbFB74nYwbxTLQt2IFn3Xho7tkF
PYX1TYgPVbLFMkKvQKctafbp/zi7tubGbSX9V1z7lFRtNryTejgPEElJjHkzScmcvLB8PMqMKh5r
ylZqM/vrFw2AJAA26Ow+xBN1Nxv3e/fXrAL7BdgDbOLov45v96b9yKGlW3X6P65vLebzkecFFvZI
zeotK+8H2jAptyxcDlxStfh9OWvaTpsE2P2RdifI9PTwgLPYFKVkn6dUiWnLTP/wJKZRVn/98X55
fnq5y59+0LVm8bDEdhwH6ZqrrGquK05VS1kgspAspy16K9WRw6lSj3ATic8r20+Ta/ti8nEt5eZi
JetajkiyTw2hHj7VqCEx2/XRKU5AYyw2hJQ1BgCD8wSioVDBgOvHpk0f6HxUYMkJbptEoRyfdySP
S/b8RJnQOj4S9PBGUxi7HT/nFvGvbfIrfLJyTJtUw+cmV3jgtclB3nFMJDramYFS2yoH3Jlf65/R
Nas66PU0y5tQuWeFebcrsJToLoc0pFVnTZXNxtSqdpDq5Ki7CotuGYr2EGNcEaoHY+3gX9mPZ2YV
Wb5N6Zlb5T1u20SldNmuGHSiik7KdPLKjbWWiLehrSUP8UzahLeCTD5uXUsTPS5KfKSZzwI6GjRJ
eOmFx7lFm8cPi95zaB+0IgqPBx1wnbKK7n610fq0VPCb5yYrZHhKqZMVPDL5gjFdrSSFDIqbFhAs
T7nJH2nLUcOH35mehn60t8vzn9gGZvr6WLZkl9KaA5jSVS3/ZBCPWll3KbCpeBL5jb1VlYMb9cuC
Do2vIv7NjLmJEe1w8QaXTbNGdvXETKYw2rB4ZJN47FEsrnJ0o8Hktg3sCkrYex0eYYEt9zPoDZXA
ap59SEhnOyiYHWeXruX4G6JlmbRuoGC6cipEvHU14jYuAlfG6J2pvk5dIMJzamNZtmfbqEkcCKS5
DTHvFbw4xmBmZtZCISNjG+aZq5cCjKk8B9MUbFDo0YltyaZjjDohMKq6AP5wJVuL+BMsAUBfx6Gm
Jz4KtSe4vqWCL49kfwocbP5Wx3gfyRHqGDcX0V+mKOgL06+lVOAaK3sEqu5Ip75GTVwDtiTjJyS2
Ha+1Isw1iCevGh4y2gQkZxyXiRPJPv68kjrX3+g9bBHmh/cVDkuqUbuYAArgIjtdHvsbG/UU4Nrm
cBMaWQV5ncaB/7cuKsV5kOlg6hls9IJmrWvvctfe6ENAMLjBsTZHsQu0f79cXv/8yf6Z7XGb/Zbx
aan+egVILOTJ7u6n+W31Z8n8lzUCnEcKLQt6qANevLxv5GMwIwJ2zqKqIYJYtMXf4bl+eOj51OF3
NLy1WEAEZJxpYmY8SZ7QvnBtZirFPXJent6/3j3RE0J3fXv+ujr5N13k2/5irYVPurfLly/KIUh+
OtGXsPFFBVB6lnU1ciu6Ph0q/ByiCBYdtjVVRCaYImNqa54mimAsg9coHBJ32SnrPhnY6oudwhqf
zOZHosv3G1wEvt/deM3Ovbk83/64vNwA4O36+sfly91P0AC3p7cv55velaeKbkjZZqns1aSWiRRa
MC2FXZMSvS9ThMq0UyALNQ1g56mPn6nijgmyWk2ZV/1Ypj63hUG/6KRbYwxnftrKtoBDg18CZfRv
SbfSJdafUjrn0yNOBc+SbdzIL4iMtXj1BapcKCYlEO0WYWVVKdOBkjHT0FedBxg1i5xNiA57zlb3
O4LmqG4hnJq6No4nwti9G+lqfA9To0PzqEx7mZvQXdL2aSkD1HbxoHglAoGueV4Q2dGSo+2egXSI
6WnpE04cXRP+4+32bElQfCBC2V11wD1XgG+Mz0B55alIp/sjSri7jA7V0nQJglnZ7XjPUPPH6HVT
Kb1pYixsRuRsNafF5eFkOwJZQab68TseyMEQEkHIkO3W/z1F7YhmkbT6faMWiNP7yOr1EgEnacHT
Z0UlCITeUiWnq/FAJV4QOlhyh09F5Bui2o0ySzj/hQhEB97gSOOzhIaArzBCLHMjNP6KWh3yeyS3
fuziJc7anI5wNDqBIuGsfI0j6AuRngr4yyzV8S7y1aOMwtJiC2IibmD+/OOv5Z3xVMOe3WnxLRSO
IR7tKLR9cJ17NEsrGPbjyBRQ12uNGwNsOzJ8Wnrq3MiePCNjR7d3Llqehg44FO1CEvAj2/SpY4h5
IUTSgh7910Ztc6ICWEeldBftaQ0g5681ausX2HdtQuePaDHnQbwqdc5DGnxj6CIbzzhVodj0sgAy
FIDuIUkxOjoTAAePIiBPQHaAVuQmNMH7Tw3s0aZfaz2YTjx88qLzHtp+dMw5trPWgEVchxutehhq
SZmIS9qp5eCI8g9WraR1HdcQBETJliEGhdxZN/Fa0zZ9wGNvqVYIqz0sLqrW0LjO6iRPBTSAF5nj
r69esPZF/rAjRZbjG19JMvTW+7PjWdjSuwgnOw3G7t4OO7K22hRe1EUBNu6izkUGD9B9ZE4s2iJw
PLQrbh+8aHWgNrUfK5ErBB36ATqbmiMJSAJyxLOR/vun8qGox35zff2FHig/6tXijWQltV1H/8+y
kfQWsXQnhhaYc6qK0MVqYrxtnfz72vPr+/Xto6xLVthw3F8pwr7Kk13WSq+2CcRqZtaoGG1p8CLx
TvjrApVYosxQ4pCWewVlBmhTxLQDKcs0VzPB3ttUSiU5MsBlfwMWKnv+IDLn8XEgfQbyKAZBm9OT
j/qFsI2m1AC70xbsinTK00ud9+pbTE/PvWUvut+Q1AqT+TofII2h2Muxd2eGVNZHlv2FuZmgozPM
+A3+/EG5qZ4EEEBc9jpqj2qZWnouQmsrT5AA7UCLXy7n15vSU0n7qYyHjlUXnveCGCww5p4DAS+m
FxRK3h53kn30mF1IaJcpcekfGXUmHPnHSs+iv4eiOqUz8JGcN+CakVSEwAhvjqKZcpFDyo3g9E8Z
nZ2Acax2WSoWjTFCiKkVMX0SS21Ijr0wzJlpYH+Ty/ZUh8TzwshCrOgFB7/PKaB14ywz2CAdOju4
Vx5v4sSRhnlNGoZ5VQt46onMkV8Z81+WRm4q1sK+ZMvAGPyVbSjStsURVkShh21OZxLFuUjm4Fe/
kgR7GcRsJkQhZsMM1HH+tMsqOpsUxZEZe0gLAXDUX7Q/MkmNWij3gBNpAf0A8yud+bOTckMM6GT7
oxLLpAQkUTrQ4pycUjWwS9yUdFrA+iXHGldTozmpme/GdkEv0vKICeMK2C2enBHBPCU1PocI/pbk
eYU+kwmBrKyPHaIYwiiYv4J5CEBeU9oDjrud7JgKOVLmx118wp1+TsygCOph+Zx+eX67vl//uN0d
fnw/v/1yuvvy1/n9hrkeHWinaXAvpo+0jFneN+mnrfooJ0hD2mKbuLYje44yNo+5JmsLB4yPsJEG
MU+kluW/dairicrv5tksmv2eDvfbfzmWF62I0TORLGlJ45QLF1kbjz3fmL8ha8lyeAheHeehHE5N
IstYnDI5QMmyec1MjuSI0DJZOV/KDGyDP/ELF8sVKeqcVkNWOZYFhTUI1LHjBoKvJz1JBC5I4HMj
F6UDBY9LK/MdJI2ExIawkpMAPWAV2Ol5FrAitITsU4yqWPdLwgZ64FnLBks6J7KWfQTISNdh5GUj
MbKPk0OU7PRLclG4DukW9F3u21iVEzCOyyrbGfBLV0ksy+jSYADiG8cRM6ZzrHt8ayqk4oDuQ/bo
LDuO2joOHA/LbvJgO+aJhq5fA+kG4tj+svEEr8IZRWZm2EGC8XKyrWO0s9FxSBJ0/BYJsVe7OBUp
DMYWswS+oRgrD4ySHlwk+dZHL5MnvZk0CerfRo7vG84UU9vQP4+kiw9JtUfbDv5AKraFmtMs5Xxk
DMpsZETL7ACZCWd20C+Hz8x2+FWpke2sZg0e9larwPVRJPmlXI/mMoemCBz5OULlhb1r/C6y0Yph
vI2tXn4tuCurD0ngyi+zFUtOnees8bBOO3NxeypdzIDspYrBWrgqJi+Y671eWjmVTSyybmp2o5pE
5nxQwknOXVlc6a8ujccyYisYXSCxjCadq8G6joxPJbsesK0ef6MUcnu60zrUCe5vOc5Nu6BfLWQW
13wCW98GPGwr0iQO/vAtpH5rXLSg9ykgJZUaosNYfcxtm63zq0vYKLbSEFwkWa4OnENXAmyeHZkJ
Bmo71mLqWcj0U6RQM9hKFfjOcgfB6MjsAvTAwumh+pCsr4WrI6VkSwzWKTkHW4GbLvHRmbQN1pay
QkEkmlOhJzi6AmPLdZyRlcWPNgrbPw4x/s6oDK54pVOUrPMOIZ1V4uVRQ3Bh2vEMfF7PMZbJEspd
rSb/cCQc+Yg81FgCzOfQWAtJt4nWNy8lUxGsrm1UIDlivYgzwCnso4/bbF8sh9WpuI8spD/Tncty
uYPtDEockO3cPf9XucxAFoq1UxU+ES+odDOZIEUbG351F2r4sMMHXFMdO+0k33T0dLlxcLB/yqTl
N7EiunZvDW/wUWibdNLDbJTivFMXBD7+EM5YyujnljZ0SX+/CVfu6ZmEA5Y8P59fzm/Xb+eb9nhC
koyOawd9/BY8gXY34pioqrj616eX6xfwK/58+XK5Pb2AwSBNf5lYGKEAkZThRGoyayrlREf2vy+/
fL68nZ/h/teYfBe6+gFOTe8jbVzd0/enZyr2+nw2lnkumHIUo79DNfbFx8pEpBzIDf2Hs9sfr7ev
5/eLktQmkrfs7LcCtGnUwfEHzrf/vr79yWrix/+c3/7zLvv2/fyZZSxGi+ZvRKgdof8fahA98kZ7
KP3y/Pblxx3rTNBvs1hOIA0jXzkFC5IR2nnktzoY0dR5Talyk7nz+/UFLL0/bFWntR1b6bAffTvB
CiGjdNTLkabVkPDixpHHMF+MefL6+e16+aw+MkHEaUMn59JL7Ww7iVZp3qXDPino6QPf/O6yJn2k
/yHO4vOdajvs6j2BMBjI4D+WWfupbWsZuhOgz3ed/nsgEG4l8O6HXb7gbZMgcL1Q6S+CBUDSnrXF
HzRkmRB7u5EEfDdZpCuCuyzoALJty77mEt2VT4EKXQexnzieAft+FrBRlV5kogcLeh0ndPRgNdiQ
KAoxDxTBb4PEcsgyJQjyZzsIPa1bXw4wNNIPtm0tMwaY7E60QTLG0drXcsYEcJWui+QM6D5C54Fu
sCzwoHNrnQui5eAPg6NA3kaObO4i6MfYDhYxOwQjRHeZI79O6JchovKRGchXMlpSAc8xdGtUV2Va
yvF2GKNMddEkK1TXQyCa5uT7NsSNAceXFpgWGhXwb2SNEG0rXyvgbiNxjBayUJhX+Nv1zK9q8M9Y
SbDWkSdGRkMeVz4bERmWmeVRzxLVkX9k6t51I91U21MuH7GXypHbKqfQiVpnWFIGb/aJLWMG1JnH
9gQCmeb9z/NNghVaLDt70t6n3bBrSJE+VnpUixEfXFUza+mzHCxcoJvs0HAdWZonkEXllfhQgPco
ZL0dtLc/wF8XPHaP1FR5jmI5gQ72/K6MjYd8r1ipPOqAqCNdDiHSR8EErjUsbJDA9Gd4lNFC6Y9h
W1QqJOiRPKZMDjdOYIYq8GELr/aPMDkQgwPYLNsdjmUCcD45imXQFyJf80NoSs/upjz0GakKcxZJ
nDaHBH8tBt4AW4zchLDNJUyqCzq0CsN+kWGx7AsD2DqL152TuqtqM389Z0zCkLM0TenJdUW/2jf4
vQRA/hliqRx/y7r2uKZwFOkApBD3d9vXtLqqmA1LYkD7rXnAGxNztUaAb+qn2wLO0iiPG/bR6T4h
Na4YXCzva7IGRcr6NnOsamtnyFN8x6uJ1TjYG5diEOsnumiuyNC/lmU5w8noRczlirTMq8cVgdO2
wxukaM0jq4652Rid9Oojfnk1hQU3d5xR5MEQs5vNUwIeAm8dAR2xpXvJ3X1m6MKj1MHYyELAPI/U
EO++xod7vlrGegqwvVYRzDgtDMy9DLCVO9KsKQHDc3bJTxuWypZdZpqOi7yfZoC1LmaoLs5t2rXu
ybCkYx4Zd3mnxEBw2+/n8+e79vwC1wfd+fnr6/XlSg/Qk3sZigzMtQOcC9gEUu2M1OxIrJVVAdz9
52npSR1ZtDq6mUgfxtV7pdh1wc1KV0UA7ypPIUKVyY1zlIsbeu427S6F2BFAaDND3xTVFR+NkJ2S
BNIjxk5ccNdR5X75QLfX6fQV3lUKuqwQiAe9orw9stabNSkXFYLp8h3yUNVNujcBxo/Ch6qrc4M9
6ZRaU7l0p9Z1H+gie7ol3RtADw7klA5xLqHw0x9gKkh3/PdHOUqEEKTJpjVp1GeUoiqFEvnyXlAR
Q31MasXRTpWiR3QfS133w5M4beYr9wAay9eftiUmimKiinieSXOoP1GNvDiJ09Ay2szIYhs0+K0s
1LL4mnFtKoRT1K1teHkZhcAinv67T0u0LHkVH0rCo8hgaaz42slSj/hkLYmcYvxuXxLZJqEdmZ+c
R7Fd1tMZ1mw0A6XaF0O8PyI1I0z1T7FkkXp4pAdBuhVhYEp8Rn+5Pv95117/entGYqjSFNJTB27h
ckw19nMQWmbJbZ5MkvPcAzhHAIdJz49d4G3R5QHNxHQcIVm+lQNsTtvm4qAA8dWx4SQgvCioEuy0
w9WP6G1jEZntMpGdMzhpdtDn52C4b7483zHmXf305cwQFyTo2Pms+4GotBqwlJgh6Q578Rz5AiGd
tG1Hl4HjXnJ6qXbDaFStnJZ44iu7DTO/eRiatFBRwcXV+rfr7fz97fqM+KylENlh4XY+Uen0YIhW
gGjlqX3/9v4FSaguWvXFDwjMpB2pQc4sZRd5RmGOKnsRNsTAAYLOnczE5+wr2ZxWWQh7Bmeosf/Q
Pv/6+fHydpYcijijiu9+an+8387f7qrXu/jr5fvPd++AQfMH7UOJ9gb4je6jKLm9ql5U49sAwuYB
Ld+uT5+fr99MH6J8/qLU17/u3s7n9+cn2oUfrm/Zg0nJR6IcqeS/it6kYMFjzJRhHN/ll9uZc7d/
XV4A2mSqJAyBJuvSnrZCbLgDmtL859qZ+oe/nl5oPRkrEuXPnQIQBsce0V9eLq9/mxRh3CmoyD/q
MvNuEq6kYEc9pix+3u2vVPD1Ko8uwRr21UkAYw5VmdDZQA3iJ4vV9DhAJ2lS6kcCTBZ2lS3dnSFD
VZYDVKS2JrL7h6KGzoTZKdXLswiLMBedH/BnbWkPx6VRQfr37fn6OuLGL9Rw4YEk8fAbUeEJR1Zf
OxFmVSj4u5bQnaClp7+4GRbk6c7B9TbYHlOI0f2l7flhuFALMQdc1cF25jCQLvwua5IBgAlzunwD
tUi17krfVh8+Bafpok3o4pcKQqQtfB91uRX8EfsW0U5ZdFwBoDAaDrega1CjeN/AO+aQ7HLAr8bi
c2XyxXoGfjial8xMG+ItSlbsWFS67jsqcQFdsSoBolJL7B5uxwfF0Q/IAvNI9uOZl3Ewo2L/i28t
5s9VnWMGWhjYk4ijKm7HwC/4DoJLiG/XE0+TaWjiVi7jnkbYuCinn5G4MRgS9Lnr+SuGBpzfoki4
jBsqthiMoL+wjGRTKtuC2BEagrcgjvyETH971uK3CAGv0hRE2m0R01E3hS9HqLoOiaNoSogjz1EJ
cWXHD9p1m0R+hOUE5UGXkdCHQsmxm6fsKgvKfd8mG+Sz+z7+7d5WgD+L2HVUlF8SerIhnCCIUs8H
FEHGmxu4QWBpH0QeCnBJORvftwfh0qxSdYJ6Supj2oD4sZHyAsfHDtBtTFRArra7j1zVFwZIW6Kj
UP7/Db6m7j0wS0V4suhkP9wktDZ24ysUW3bbgt8bZfyEThCoQyd0NthZnzG0TzeR9qkXGqzQArmT
8t9Dxm+hSEPoTjDXNM0CC5ujWYj2Djy5MIgGW0kwjDRrsY3Gl2FjwJ5ORiWnvzeqDwFQPGxwAGPT
q6IbL8BWbgKWnD24DkgzAexarH5JiyKVFsc27X22RgSAB5WU5KWjUtLylOZVndLe06Wx8nJ+yCJP
hus49IqHYlYSp9fyxnG1NFoXO16orAqMFOFjjPE2+F0W52G1BxstS7Y+B4KtgNJxSqQSHPkeDwga
IBVcEAbobVcR13Q3I0NGU4LnOCpho5qVMPMyQI0GrI7AgooyXBOXw+82r0ks7doJnI1azSU5hgrW
LN8D0i2ZItaUAEA1NtE8NyVs81xUiRHQtu1oFUuzR8f6qhXZ8ZImW0iONK+1ZBMlTrYdW8YfFEQr
am1rocJ2otbylSlVMALbYKjP+FSX7PDIaeFGNhjltMj19PK1UaDCHAuNDCvYkGBBd/a9XsGU0eWx
53tYXzrtAttSm1NcGfajmv+rwe7u7fp6o2fnz9JKAZu6JqVLlQimoOqUvhA3Gd9f6HF1Yd0bueg8
eyhiT9jVTXcdkwKu4ev5G4tVwYFm5CWsy2lP/V/Knm25bV3XX8n06ZyZdpYtW459ZvpAS7KtRreK
suPkReMmbuNZSZxxktmr6+sPQepCkKDT/RJHAETxTgDEpVgRCT0VKrrNGxzJpkWTKWLL4NlkqSQM
MVNBwJHfbMy+Y3ahSPnlYKCdBDwIR4PaDJOioAZ3iXDKaFMrB7JQlzEIVcsCB3fjBSf9rja30+Yg
aRW1Zm+qOD6H+zaOD5jABsenp+Nz39Eaj6ckiSb6Bo3upY8+hSZZvj7BUt5ZEagRUDo0XrTvmXWS
sggvurdUpTThFROoVI+9psUqGL1WGZWhcWhaGLhmtBvzcLXmxPLbqUXjMoH3Bw7PLoEakRHSAYG5
En/sGbKUPx7TLI5AzNCr/syDEMg8MgoAOF2CP9OzwgNgYBiF+xNvXDplMX8yRUwdPNuSmD+ZTRxL
RSAvfcStiucpfp4MjWezigYPiFCXA0fTTe5vNDC4u+mUdjWCSB1MZ6+KvDIgfDzWWW7BwQwNIQaY
mokjxF068UYuFNv6Qwcr5E/xzBGcyPjSEe8RcDOPkqEqFSph6kFYfOMsEwjfv6Q6RSEvkWDawCZ6
EAp15rUhlTvfiTMLrHO/uX9/evrdKF11jayFUxHRIUnf/vnud+eK8S8EjA9D/leRJK3eXt17yYuh
3dvx9Fd4eH07HX68g2sK8v5oA56i+zLHeyqS4MPudf8lEWT7+4vkeHy5+B/x3f+9+NnV61Wrl/6t
xXiEvVoE4BKlgPpvy27f+6BP0Gb36/fp+Hp3fNmLUW7PbUO/MyDVJwo3HKEmKNDEBHkTRLUtuTcz
IWOsuZynyyG5ky62jHuC9dc3/B6GDwINjg4B7SRc3pR5rXskpMV6NNAHpgGQR4x6G+xnaRQYKZ1B
QxoBE10tuzjfxrKxh0oxBfvd49uDxna10NPbRbl721+kx+fDG+bIFtF4rLM+CoC2W9BhD4akb3SD
8hDrQH1PQ+pVVBV8fzrcH95+a/OurUzqjXSWPlxVWM5agRAxoO6YBcYbDNFEQvnm0zg0osm3VBX3
dPlFPeMxb2B4JlVr/TUeC5bSx88eGkyr2Y2JmNgFIenF0373+n7aP+0Fs/4uutHSwCIVZQOa2KBL
3wJhJjoeTqxnk6mWMNTcxTbn00u9Ci3EXHgNFL19lW4nSMWwqeMgHYvdAY2YDndwE4gE83cCI1bs
RK5YfF2BUM5iWwqKa0x4Ogn51gUnt4gW1zJLnaGec8T1AmDscAA0HdpfO6g0C4dfD2/kPg4WnSyh
7iFY+E2sD3Ses3AN6hY0JiwZ0Q4oAiH2K10xWYR8hnIDSMgMTVJ+OfLwmp6vhpeOFD6AcoQMDFJR
zpQOlgw4OkSMEOE9bfMLIJGTj58nuh55WXisGOBoUwomWj4Y0Bb38Xc+EbsF3eud2MITcRIOkQ4C
4zw6pJJEDh1Mn67rTxwW5D1JUZLmOt84G3pYxV0W5cD3KLawrXOXXkvjf0vakz/ZiAk1Rin82HaM
Y1I0EE34yXKGQ3TnBYQc0QarENWW+cLQtjwc4moBZEyq+qur0WiIVP31ehNz3c+uA+EF34PR3lEF
fDTWQ3VJAI713/ZfJYaVjowvMXpEfABc4lIEaOyP6NWw5v5w6lHec5sgS3C3K4iuHN5EaTIZ6Lye
glzqkGQyxKH5b8XgiLEwKtRsgHizUnELd7+e92/qkoRgC66mMz2PhHzWj7mrwWym72PNRVvKlhkJ
JK/lJMIQbAVMbJAf3KrBi1GVp1EVlZihTIORrwIA4JNBformDtvqnUMTzGPn4JEG/lQPWG8gzKs5
E01rAVqqMh0h1TuGG2sC44yOvWEpWzHxw/0RfXFGTgk1Wd4f3w4vj/t/kFgldVRrpEpDhA23dfd4
eLbmGbU5xlmQxFk3quengLqSr8u8YlXcxL3tjnvik/KbbS6uiy/g0v58L+Ti5z1ukDT5L9dFRVsM
yBw0lDqPLrphFZ4Fwy7D9O+ef70/iv9fjq8HGarBWnnyKBvXBY6GrzU8WHMx8zt3nmxJOyf8yUeR
cPpyfBNs0YEMueF7l9ThHkLQRfOSxx+fUbOMyUwKCqNfOQXFeIAumARgqDs/A8AfWaqZ4cDh71MV
CUhRZFc5eoDsHTG2upyQpMVsOKBFSPyKUmCc9q/AgBIb7rwYTAYpMvacp4Xn4MXCZCVOBNodLCwE
i0m/hjgRw+GtJSl0WTUOCuhSJKEnQ11gVM94I2pgOJdwkYzUi/2Acd9xISgQo0trJ5ZVpqGkNKAw
mD/wkSi+KrzBRHvxtmCCjZ1YAFx8CzSkDGtweznhGYJn2GPOR7MRuuexiZtpc/zn8ASCLCzn+8Or
ir5i7x3AqPrYbCiJQ/Dtiquo3pDmHfOhh3PMFGJPoayLFxAKBjPmvFyQqev5djbCmgEB8Un9BhSh
LXRgh5q8Eh2r44+SwbY7RrvePtsn/3V4FKwjg3ApeFV/UJY6XvZPL6C8xCscSykDBj5aaUFx6VXg
zXS2U+yLcVpXq6hM8yBfF3p0fD15RJQiF5M02c4GE9I/RqHQnXIqpK2J8aytvUqceDp7L589ZM8E
Kqrh1KfjFFF90gkYlSZriwfwC9ULBhBLKUYAMLGezEwC4Eg0348KWmQEHL+Oq2BVRbTlAFDAWihy
cj0Auspz64NgIuwgB7fXxiMDvSJzUIIDBlmPTRqB3z9Rpkqk2z+YGfIAZETuBhCrUsE6VLo1p6S8
DjAAMm4sKuMTTRKJpQlWcxsDZVLlkQnj3IbguI89tHGKQduTQMoExlM732pcfr+4ezi8aO6d7dor
v4O/Dlaz1IuYtAlhIbjWiFcQV2mW3RVdsODKjMwg4xMJrgOCK9NnsbrJFm/nQYXDELUbbsSjSjPp
7/tHYeZlkHIxe5QdAtIdSLwaqSUV40MRVHGfu1edM6ubC/7+41Va2/d9t4wyUdfAiPfRA+s0FuJR
iNBgwgxeXAg4D9L6Ks8YYD2MgmKaVD5iVZUlMmDXkaHzNR4Lxp05cCzZIP0kIGF+x+l2mn53BMNX
bduCq7vdQkAWW1Z70yytVzwOHChoq1EpaU2Gw5DAl1hRrPIsqtMwnUx0nguweRAlOdyllyHO8wBI
6ccDXb6iNVAGTUxveEDV+s1DrZ1EYH8O4cScBN0mASYIc9rPD9NFqRnxoj3n0ZzsegR8K4wU943v
OCscXtRhEgmab4bXeM82VwXlQpzq22Sqgr1iQFJ0thnF/gSZziQn8qRuZpCnedumM2TdEtWdDkR/
o/sieG5d6errMq4oHxNJdCV9uM1DR72fMjoDah+jrd0ps7DMY3TmN6B6HkPMFdtJ3Azg1nYy0xT6
bfZX/bE7wvoDUoJLI0Scuta6vng77e4kv2xu+LxCp4Z4BOVrBXlGOLnr9xSQ8FbbfQARrtP0BoN4
vi6DSLoQ5ElkfqvBdsm1HR9syBaCAwgiezJXK7JXiXa3hYK7Bz7kpJtoAUNkhQ/Q3qnTZdkRG0KT
iQ82BYFszOzoN+MgGpvXWy0uZcFqm3sEVgWaIpqzKKPoNmrwRIuauhSgJlKMc2kUrVz9e2C+oOGt
+4xeic6lZpHSPiEdAVvQbqcdQRbnvI22wII6G9EBsjt6tPksMLcsHussks4qdZaHjqoJopTxqkm6
/hHNak2dixoBk/EyzGoIpoLaSyVqHoF/j/lGHpCcGMQcEaO37e/dNA0j5QuZrsFedHk586hw3A2W
D8e6zAlQnIEeIGmKfV+pD3fHUVrnBTqMVIzIehMLAY1m3nmsu3/DU03FT+NJnNIFSE1loOKg6G80
sdKp5ufcjIwnGYIQbZUquJ7Lg9nwG1R2QYdHIdzJE1p3rwzEwo7q67wMmwTz+lc2DDQTldj7OLgq
cLLCgMt5LAYt0Gw+oy3ISviUaGH1HDz4xWhQPQbZx6SHv4qj3LH7WQiG2jcOvChU8JDlTdHpmXvE
RvDApI3DgncJ6druMAGxAkj/T1QsUwii1O/rXPdLkY8Q7lB6cHfBajTGsRTAhuyalRlqlwJbmSK/
L9Kq3tAXWwpHqZFkYUGljRJbV/mCj2tdIFUwBFqI5iNAsOZGIrQ4RwS56PSE3dR4AvRQsYeHcQnh
e8QP2QyKliXXTCzYhRC1HDGttLeA6aHjXGhEWzHAssUfEaaR6Lq8uLH4m2B394DjEC64XFTkymyo
FSP6un+/P178FAvTWpcyQgFSEwDgyrTFltBN6uAZJBakxyqxXioYJPPLBeNJGpmrCAmrOAlLPaiJ
elWwlKwMVhBwsVprdbyKykyvs6HpqNLCeqS2DoXYsqoqTWAMZya2gl2tl2JtzUmfUsGPLsI6KAVv
p01XWfcV+IrESwiTpTpDm9zyp10CvUBgD1f3HciHBhuTCuSF53wJeRNlaeQci+SuVZP1/7ZYcA9N
gxbSbAkDCy4FDdv5tsdDgjfYEcm9S5FxwUiz8ob4ajsodrndOJKN7Mh4FKwdu7GigYCxcCUA3gK5
3M25/b1bI2g+Qia3uf1GaSbvNfFrISSdwQepmHiCY8uodaaTiN08hwbaVVB4SKz34XcWbCNkDtEQ
2nJhHrunU1Cy1IEq89R6r13XvMKuIPK5C/RyBZFG5jdCEP06HHhjLSFgT5gAn9COHq1MULSiWSSd
STXuqKx6CeQqcKOnY8+NvOVV6MZqCLvefY3anjlbf62KLT1RrF5ZqliTHtX/43pYNfj0+O/44e6T
RdZKyBjexLbBwE4SxmAx8xDzOM+3fEHPN8EOQWReY89skQb3Ac8bz3hGN9oKYu4+OnL89ckgH9c0
+1TmeQUU9HXDAkITR00CVcEuko1riOA4FDJjmBltCWMOkVLrdVhoQZ30b1C3KctSOgyLnTvXbGmA
ETYfobXog6bfU9N+sdFDcqkoKXTJm6+zUs+Jop7rpVgTWhc2UHfe5iAqVvTYB2L30ouCZ8lKkLlR
JRayzl5DWEs4PSIifa2kuo4YREmDo31F1wmo1kXAHIFCJV4eca6KWIx4D3Wk8OnwoJ4qxJy4cezb
kvAP6sevs7M0echcZwNzHxuzwrFQ9bTx4qHfRg6vx+nUn30ZftKmbgKTLYwkczkeUe46iORSNyDA
GN2QDWGm2C3CwFFTyCDxz7z+YY2nkzNfn9A7ikH0cRWxT7aBo26MDRJn1+FoBwaOcuhHJDPdjwVj
zozJzGFphInGdMQUXMVLV9tjnsNcrKfOWgw9n9LZmTRDswCZfv2Dr1ovtQjXSLf4Ee7OFjymwda8
bRGUj6SOv3S96BrxrmGOCg4dNRxaVbzK42lNy/cdmoogCciUBcCysgx/DMBBlFT6XV4Pz6poXeYE
psxZFZNl3ZRxklClLVlEw8sourLBsaiVikpmIrJ1XNlg2TZVJdQpgKvW5VWMTzGNYl0t0EwPEzoy
6DqLA0vH3LrE6epA5bO8v3s/ga3O8QUMEDVlBBxaupR/AyqZ75DjvpaaDsTVRiWPBUOXVUBYxtmS
OlbmVqlVuRZvhQa00elZcPFUhyshIEYla2XEljNpJMw6TCMub9GrMsbK1zNCaIvCeiu5Pcjw9jDX
E/lJyiwPovyuWBlGmagxqAxBYyS5lwBn6bCIkEbDKmEhijATiJwhh+rywhFnfyHYTdBoqlst8sqL
gU4ESgNh1OIPKbT4ZLX6+umv1x+H57/eX/enp+P9/svD/vFlf+pEjVaa7EdIdx1OeCpkk+Pd3/fH
/zx//r172n1+PO7uXw7Pn193P/eigof7zxCv+xdM0s8/Xn5+UvP2an963j9ePOxO93tpltfPX3UZ
sX86niDU9wHciw7/7rCPawx3r6JRwZUU73XVr0BAKD0Yvq7yWLvc0sBdl0ZCrjhHPVq0uxmd77+5
QDvWFNZI3l6+BKffL2/Hi7vjaX9xPF2oQdAC60pi0aolijGLwJ4Nj1hIAm1SfhXExUqfMgbCfgU4
dhJok5a6dryHkYSa1G1U3FkT5qr8VVHY1FdFYZcAErdNKvZ6tiTKbeA4i7xCren7FvxiJ02ClQC3
il8uht40XScWIlsnNNCueiF/LbD8ISbFulqJbduC4yjH7ZSIU7uELh6h0pK//3g83H35e//74k7O
7F+n3cvDb2tClyjFqIKF9qyKArtqUUASliFRJE/tDhLb2SbyfH84I0axR0LmFduO4/3tASzQ73Zv
+/uL6Fm2Eez//3N4e7hgr6/Hu4NEhbu3ndXoIEjtISdgwUqc08wbFHly07iLmfVk0TLmQ4d3nUEj
/uFZXHMekSJ701PR93hDdOuKiV1z0w7vXAYUgOPi1W7dPKA6dEHpflskVk93UFIR0dZobtUyKa8t
WL6w6QpVRQzcVpyog2BZrktGmRS3i291ZnR65Ae9rhGyzZbaVlgomM5q7Qgm3/QJhLO1TXl2rw+u
oUqZ3RErCrilumyjKFtvjv3rm/2FMhh55HyQCGWgca5Nku5DAjGkidgvz9Ftt6aGCePnCbuKPHuy
KDg1NxqMuUFY1auGgzBe2CuePD/PzKZuikAuKFKj0B4y4dgqNw19GxaLZS1NMO2xLdMQuda328OK
DYmqAVhMcR5RPp89jedPFBVdhD/0/qwQqlr+kGBqVmxkA1MCVglWcJ4viXpdF74r0bc2jrWcf5BM
2prRir07vDzgTAnt3myf/gKm4nvb4LZ8Ypbm14uYmE8twlInm3g1qaiVyiAfTEwZ/RgUfRkOvDqA
xA7355Sem1QlqqQaBTh7ukvo+a/zakL2gIBrL56bDWF05tASyFEdhZGrAgsHz9bwAU6EqzzBihbI
3BvD5aH0wbvn+ksjcReTUnOqus4XtKYEE7gGuEU7PorR9eia3ThpUPvUWj0+vYDDGRI4uxGUV6Y2
63GbW7Dp2N6Rklu7tvLS0YLCjWFbo3L3fH98usjen37sT20cJ1U9i0/IeFwHRUk61rSNKOcyeufa
+qjEkAyAwqgTy5rzgAvo+5eewiryWwzZZyNwwijs8QE5qqaE3RZBy58d1inQdhSUUKojxbrf2JJi
R9EI15T8J/FRJiW8fA5XtKQZectwwfkRZwtTF/B4+HHanX5fnI7vb4dngn2D0CnUASLhZUDMNIi1
0nAtjZfJORr7CFI2OJtIUqndhyxAoc5+49zbvfB1tgRdgLPRoaNnOjaqBKuOr8PhOZpz39dYNVfz
kOxmEzm4mZUtxoDlccHCJoeSfeh0WJgQ5w6gnpCvmKMo5cUWOdIjWYTQisGYTsugEQfBGTEKCL4z
+6Rq4HW4ms78fwJKkmhJgtHWlSHLIJx4VKQYg2osSvuwOhubrUfVOYcXtXCgs1hsifTHFaoOssz3
HfXTcgvZSM4W0dbI10oNlWCHycJZmuTLOKiXW5sHNfCmfyTjNymkTxRYuAioboqIRBbredLQ8PXc
SVYVKU2z9QezOohAXx4HYN6kbKB7guIq4FMw+doAFsroKLoua0t32k9DIZfiEOUcbhnsAhQe1GdQ
DjktebyEC4AiUtbR0rwPamxcU6gjAcJs/ZT6pteLn+DUdPj1rFx/7x72d38fnn9pDjrSNke/nCmR
ebKN518/aQYBDT7aVuCS0vckffOSZyErbz78mjhTgqsk5tUfUMgTEf5T1WqtcP+gD9oi53EGlZJW
2ouvXWAx14GaxFnEyloafermZcwwWJ+L5RdB6mVtvrXumkKGzAK49imlN6A+43SSJMoc2Cyq6nUV
67YbLWoRZ6H4U4q+mceGS0IZxpSDh2h6GtXZOp2L6vYlqps3Pc5z524axJDOjRU2ygBLNgBspYK0
2AYrZcBURguDAox1FyClNb4msd7orgyxogXTmjXBZtCRHYiNSPCICDQ0BDSxEUj1CrmhiZpX6xoX
MPKMR8hIuzDd+BqM2Iii+Q0VQx0RjIlXWXntyuSrKMRA0uVigQazcYFmeiM4iE691hNo3jdK5aWP
fRbmKW5xg6KNLwEKbl4mHCx5gWPFotCt4roMqG44iqFUybQBqctyFKjJ+tHWohJM0W9vAawPooKY
qj0TLX1lHUl8G5KYkZq6BsuwA34PrVZi4Z4rl4sjh1r2DXoefDObZ9zl9P1QL2/jgkTMBcIjMcmt
nplKQ2xvSXAjzRr7CnHHXsoc0XmSI7Ffh4J5wdSBEl88gxpqrPY8WKEHaUtbydQuulWr9PzZsKSu
EEfEOM+DWOxYQhRiZamrF2DXE/ul7n6rQGAxWqN9FOAow1cmKyzzH9XinFhWKwMHCFGEvM43fSMA
x8KwrKt6Mp7rtiv8Os6rRFNtA2mQIvYfQEVUivNCoiwGJNz/3L0/vkFglrfDr/fj++vFk7oa3532
uwuIzfx/moAqSgHpCooE8x7w1NDszzs0B+2zNFGntkKdSivot6sghy8AJmIk7w99lwh+LAV12fT/
KzuW3bht4D1fkWMLtEGcFG1z8EErcXdV62VRsuxeFm6yMIzUjuFHkc/vPEiJj6HqHgJnOSNSIofD
edOfFlTm0yGzdkk2QJb7OuvPJClpVzGtO5y6Gw+9Rw3FuXsoV+3G/yUw7abys23y6k+Md3Gotz9H
LdXpt+5KrwxrUdbeb/ixdYu/YCI6Ju6C5OLRONC93cQXhW7jrb1TAyZvtNsiE0pb4DOHgQQUHZAx
booO89I9288MGjnf8bCtRr23cUwhEsXT1HkAoXCRKXMv/qamQnXtELSxCAqyFV5a51AuhiU1u3kt
xJCRSMycRbKqqLeTlUbn0BErvVPrw+Pt/fNXrrx0d3y6ieO6SKY9o9nzFA5uxhBjOQCBcwVAVttV
IMJWc5jFb0mM87FUw+kvM+0YZSfqYcbYYBS+eZFCVe7KF1dNVpd5qBR6zcFFaCAZblpUBVXfA5Z3
iSdiwz8QxTet9i6KSU7gbNu9/fv48/PtndEangj1M7c/xtPNYxnzXNSGWY5jroJbTWeoPf9Uop7c
gqlBPpbkQQelmLJ+S4WRyBsvZaeE2LKrIsSSCsh22R5pAXcTvdphQ3rU3MeuAI6U92UnOum3cIoq
yos9/f3k04c3zu7p4PDEWhR+vl2vsoLMpQCU4+UUlg7CXELYn5Vkv+CvAoUU9QhM7quzwT3kQwi9
3qFtqqt4Brct1Y4YG36EjobDxw9SCAOzC5NzHaQxu51xngNe9dmNItt4NWm+cS8SN1ykOP71cnOD
AWjl/dPz4wvW4XaIuM7QKAN6NhVeihvnKDg2Wp++/36yfIWLx6WVkrPvB2DaNpMJkkp+mNEwKIow
a8yzXxnEdOhH/tGhRIz+DIjTfQ/8LfS2nCkbnTWgsTXlgGJCVnmJtwRNxY3yeLnOvDKpr1oc/6M4
7SiePUxSjYQxE5Q49+v6gSjqVV0OeHtTGNPo9YyIJJTIeWvYTTs14X3XLrhrS902QU1DYRTY3XKl
OEbpW9g5ccGccJUYeboM2bDbMtsyBszbcQw59Du6FMs0m3I/SYJrN1jaSIcDm2ZBMPPhW0918GF4
ivfJnjHbLgXr85GYYgqOAjPImKZkRQrLOKnsUeLsel2NG4sskxFhUApYancY0gZprgLuFxO3haS5
OTHXUQdivwaxrzBA1YCqv1e51ElAOxf1odtRQHj8KhfysRM++IpByn4YXfvaajPfKk0RyfE7mdMC
1QvxzgMSajkVUcNcghKC6nRlDpzar+FlZzzGWudtmXbzLwIAhoAFek1Oc8HQ2HvGUKRrFKObdmG6
oLl6Nplg4LDDhbkToB2xUoe0PAwvm8q7LZtbiYJOT/zG5ZOCMZaCXyKpMBJdTqlSzMyZvi1Wz/MG
oZa1IPSF3we7ZM8FFY2iDkhv228PTz+9xTuXXh5YjNhf3988+QdFA5wSE/blki4eHAWcUS2VCxhI
Gt44LM1oCB474ZpW3W6HJBDVBjK8uGg0wmtwzKudLHPcFwZOfIHeElbar+TqYNkXSjAABB72WLlv
yLSczDGdgzAJImXRykchuYF4NHF919eM83xAIvzygmKge+p7/DBQrbjRV1yojVi2K65IffsUhlN4
plTHzhB2pmAE8CLZ/PD0cHuPUcHwCXcvz8fvR/jP8fnzu3fvfnT8LOh4pi53pEbPedSzEtteuHWC
HO0WAX02cRcNTKhcS5ld20MWncZofBsHdami01bDZxnHus+bZfRpYgicf+1EGTThSJP2MuO5lZ3z
PrOkxG8lsGkDSJ6L2dCi1qwrlXoap5fCYIxwIu1weiUg/AHTs0mCubOg5SMF54jOt95jkrVBF9z9
lAHPXBKwrYnkfxCP7ZLKF6BJa1tlOy8HzW0/NHUZz4iFpvS3qEgg6YawWoex0UoVsJHYebIiJJyx
TPXfGCAOg9CjVSTWMxv4ykrDl+vn67eoLXxGD2dkkCDvaCwxYPPKG2hpyzCIKmOVnjDKst+BpHMQ
nfHqhuA+iNU39vvPe5jGZgDtUVsWAiKsxM3MXs+d8DSZSFEEpouChfbgicXQADBQR5znhBlBJBS8
yNQwn3IfTrwBQpLBRnWuJVOxLXTufW+4NnCIsEjWRzYCu6nglfZwDFYsGVPlFiph7HAUaG3yq6F1
lB+KSFvIPOa6Tdvx53i5jheOAWQduuuzbi/jWPteWHxEAB6mctijsVm/As2UFkNr52vQsz7q1YBr
UpBgWHSkByhYhIsIADFB2W2GqBOMXgwN47DL0Uhnug6AuRkqBPLb5P45RLbmuSyUaVQXGHOL+F5o
ApICqP2m8nq0Gh0ooTXs3/5c/pyoP6tKhx0ZxJiK4kqrKLORkd88IxkKIwpbUl4l8pJ5m7fia6MA
a8FYGz8xFg/BaHSYKBA0t2vDsoAVI9jlnqpsiKYPa18Ge8FQoqE2z4LGTx90Axog7HwpJxvOJVhu
82HWJObKTdRuIizgffkBlSj2ZNGB6lcRR8DcKKZF0XBiloQRYurxPF/6qoE9GqLuMRLIXAcUHfe8
CbjmdDRhRNuyQ27h1svWWnXd2eGyirx8ODsekTKc9zT+Gfuk2c2u85DB0dSlFUn31VLIAupc9pO2
XKGqIfNoaaa89MgOkyD3TWpYZ8GQT0RFsL2liw9E55wvC+CX+7w8+fiJy2aHlhANelsluocduwvV
sS6NWdh3xnAdAYMTSVzff/9VkkACkTJidbHIGeOorK+urDPMq0iP2QbGcUUscuzkpxJ9FZtd4gEq
OXtZ+PmXRoGrNuQxTdkkFuIQalvhC2MsB5YjlzyflmW2hmreX/oX6DmAhCNsxhjpzzpOop6fcQqS
C9JGcSwxAF225sOnR+ksX4HTMouOX2+eyEUhym8dGZBQdwt19bGZuNo7CICe78G2s0ONGFt4Ghnh
0idl18M8HJ+eUctCi0L+7Z/j4/WNczMbWbUcwxi9o7GIh82+lZvb1CXt0IgHMJTEp1D9nHGszoEe
Xrql7g/20UlHOLmnZgyPB2dlpatMDpdCIDshIl+H3LNY3IN62aJC/IoOHFeY+3hd57YAywKZmdhZ
3rpp12wn1XACtxeG3XS+SRIA8ukBYiXJXGwioTwfERH4YTKEYZVyotoXHMDwLxx/kP7SaAIA
--===============0941025237558009814==--

