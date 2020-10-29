Content-Type: multipart/mixed; boundary="===============0947502756903361185=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/accessibility/speakup/speakup_dtlk.c:334:28: sparse: sparse: cast to restricted __le16
Date: Thu, 29 Oct 2020 22:01:33 +0800
Message-ID: <202010292221.yE5aIF7Q-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0947502756903361185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
commit: 2067fd92d75b6d9085a43caf050bca5d88c491b8 staging/speakup: Move out =
of staging
date:   3 months ago
config: m68k-randconfig-s031-20201029 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-56-gc09e8239-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2067fd92d75b6d9085a43caf050bca5d88c491b8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2067fd92d75b6d9085a43caf050bca5d88c491b8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/accessibility/speakup/speakup_dtlk.c:334:28: sparse: sparse: cas=
t to restricted __le16
>> drivers/accessibility/speakup/speakup_dtlk.c:334:28: sparse: sparse: cas=
t to restricted __le16
>> drivers/accessibility/speakup/speakup_dtlk.c:334:28: sparse: sparse: cas=
t to restricted __le16
>> drivers/accessibility/speakup/speakup_dtlk.c:334:28: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:341:36: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:341:36: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:341:36: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:341:36: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:358:16: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:358:16: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:358:16: sparse: sparse: cas=
t to restricted __le16
   drivers/accessibility/speakup/speakup_dtlk.c:358:16: sparse: sparse: cas=
t to restricted __le16
--
>> drivers/accessibility/speakup/serialio.c:139:9: sparse: sparse: incompat=
ible types in conditional expression (different base types):
>> drivers/accessibility/speakup/serialio.c:139:9: sparse:    unsigned char
>> drivers/accessibility/speakup/serialio.c:139:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:142:9: sparse: sparse: incompat=
ible types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:142:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:142:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:148:9: sparse: sparse: incompat=
ible types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:148:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:148:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:160:9: sparse: sparse: incompat=
ible types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:160:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:160:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:167:9: sparse: sparse: incompat=
ible types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:167:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:167:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:87:9: sparse: sparse: incompati=
ble types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:87:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:87:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:88:9: sparse: sparse: incompati=
ble types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:88:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:88:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:89:9: sparse: sparse: incompati=
ble types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:89:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:89:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:90:9: sparse: sparse: incompati=
ble types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:90:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:90:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:93:9: sparse: sparse: incompati=
ble types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:93:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:93:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:94:9: sparse: sparse: incompati=
ble types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:94:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:94:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:208:9: sparse: sparse: incompat=
ible types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:208:9: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:208:9: sparse:    void
   drivers/accessibility/speakup/serialio.c:299:25: sparse: sparse: incompa=
tible types in conditional expression (different base types):
   drivers/accessibility/speakup/serialio.c:299:25: sparse:    unsigned char
   drivers/accessibility/speakup/serialio.c:299:25: sparse:    void

vim +334 drivers/accessibility/speakup/speakup_dtlk.c

c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  315  =

c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  316  static int synth_probe(struct spk_synth *synth)
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  317  {
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  318  	unsigned int port_val =3D 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  319  	int i =3D 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  320  	struct synth_settings *sp;
8e69a8110686572 drivers/staging/speakup/speakup_dtlk.c Domagoj Trsan 2014-0=
9-09  321  =

c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  322  	pr_info("Probing for DoubleTalk.\n");
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  323  	if (port_forced) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  324  		speakup_info.port_tts =3D port_forced;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  325  		pr_info("probe forced to %x by kernel command line\n",
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  326  			speakup_info.port_tts);
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  327  		if ((port_forced & 0xf) !=3D 0xf)
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  328  			pr_info("warning: port base should probably end with f\n");
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  329  		if (synth_request_region(speakup_info.port_tts - 1,
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  330  					 SYNTH_IO_EXTENT)) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  331  			pr_warn("sorry, port already reserved\n");
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  332  			return -EBUSY;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  333  		}
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07 @334  		port_val =3D inw(speakup_info.port_tts - 1);
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  335  		synth_lpc =3D speakup_info.port_tts - 1;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  336  	} else {
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  337  		for (i =3D 0; synth_portlist[i]; i++) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  338  			if (synth_request_region(synth_portlist[i],
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  339  						 SYNTH_IO_EXTENT))
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  340  				continue;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  341  			port_val =3D inw(synth_portlist[i]) & 0xfbff;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  342  			if (port_val =3D=3D 0x107f) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  343  				synth_lpc =3D synth_portlist[i];
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  344  				speakup_info.port_tts =3D synth_lpc + 1;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  345  				break;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  346  			}
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  347  			synth_release_region(synth_portlist[i],
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  348  					     SYNTH_IO_EXTENT);
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  349  		}
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  350  	}
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  351  	port_val &=3D 0xfbff;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  352  	if (port_val !=3D 0x107f) {
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  353  		pr_info("DoubleTalk PC: not found\n");
7aa4d5c8ffed00f drivers/staging/speakup/speakup_dtlk.c Alan Cox      2014-1=
2-15  354  		if (synth_lpc)
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  355  			synth_release_region(synth_lpc, SYNTH_IO_EXTENT);
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  356  		return -ENODEV;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  357  	}
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  358  	while (inw_p(synth_lpc) !=3D 0x147f)
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  359  		cpu_relax(); /* wait until it's ready */
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  360  	sp =3D synth_interrogate(synth);
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  361  	pr_info("%s: %03x-%03x, ROM ver %s, s/n %u, driver: %s\n",
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  362  		synth->long_name, synth_lpc, synth_lpc + SYNTH_IO_EXTENT - 1,
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  363  		sp->rom_version, sp->serial_number, synth->version);
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  364  	synth->alive =3D 1;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  365  	return 0;
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  366  }
c6e3fd22cd53836 drivers/staging/speakup/speakup_dtlk.c William Hubbs 2010-1=
0-07  367  =


:::::: The code at line 334 was first introduced by commit
:::::: c6e3fd22cd538365bfeb82997d5b89562e077d42 Staging: add speakup to the=
 staging directory

:::::: TO: William Hubbs <w.d.hubbs@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0947502756903361185==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
EYnKSP0X+6rbM0CRAQA=
--===============0947502756903361185==--

