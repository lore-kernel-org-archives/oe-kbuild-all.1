Content-Type: multipart/mixed; boundary="===============7368936945091470191=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:49: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Date: Sun, 23 May 2021 12:15:32 +0800
Message-ID: <202105231221.ujH7zer5-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7368936945091470191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34c5c89890d6295621b6f09b18e7ead9046634bc
commit: f9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7 scripts: kernel-doc: impro=
ve parsing for kernel-doc comments syntax
date:   5 weeks ago
config: mips-randconfig-r014-20210523 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project b4fd51=
2c36ca344a3ff69350219e8b0a67e9472a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:49: warning: =
This comment starts with '/**', but isn't a kernel-doc comment. Refer Docum=
entation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_gmxx_rxx_int_en_enable enables all interrupt bits in=
 cvmx_gmxx_rxx_int_en_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:230: warning:=
 This comment starts with '/**', but isn't a kernel-doc comment. Refer Docu=
mentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_pcsx_intx_en_reg_enable enables all interrupt bits i=
n cvmx_pcsx_intx_en_reg_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:271: warning:=
 This comment starts with '/**', but isn't a kernel-doc comment. Refer Docu=
mentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_pcsxx_int_en_reg_enable enables all interrupt bits i=
n cvmx_pcsxx_int_en_reg_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:301: warning:=
 This comment starts with '/**', but isn't a kernel-doc comment. Refer Docu=
mentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_spxx_int_msk_enable enables all interrupt bits in cv=
mx_spxx_int_msk_t
   arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:340: warning:=
 This comment starts with '/**', but isn't a kernel-doc comment. Refer Docu=
mentation/doc-guide/kernel-doc.rst
    * __cvmx_interrupt_stxx_int_msk_enable enables all interrupt bits in cv=
mx_stxx_int_msk_t
--
   arch/mips/cavium-octeon/executive/cvmx-l2c.c:285: warning: Cannot unders=
tand  * @INTERNAL
    on line 285 - I thought it was a doc line
   arch/mips/cavium-octeon/executive/cvmx-l2c.c:579: warning: Cannot unders=
tand  * @INTERNAL
    on line 579 - I thought it was a doc line
>> arch/mips/cavium-octeon/executive/cvmx-l2c.c:768: warning: This comment =
starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-=
guide/kernel-doc.rst
    * Return log base 2 of the number of sets in the L2 cache
   arch/mips/cavium-octeon/executive/cvmx-l2c.c:861: warning: This comment =
starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-=
guide/kernel-doc.rst
    * Flush a line from the L2 cache


vim +49 arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c

80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   46  =

80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   47  =

80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   48  /**
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  @49   * __cvmx_interrupt_gmxx_rxx_int_en_enable=
 enables all interrupt bits in cvmx_gmxx_rxx_int_en_t
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   50   */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   51  void __cvmx_interrupt_gmxx_rxx_int_en_enab=
le(int index, int block)
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   52  {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   53  	union cvmx_gmxx_rxx_int_en gmx_rx_int_en;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   54  	cvmx_write_csr(CVMX_GMXX_RXX_INT_REG(inde=
x, block),
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   55  		       cvmx_read_csr(CVMX_GMXX_RXX_INT_R=
EG(index, block)));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   56  	gmx_rx_int_en.u64 =3D 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   57  	if (OCTEON_IS_MODEL(OCTEON_CN56XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   58  		/* Skipping gmx_rx_int_en.s.reserved_29_=
63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   59  		gmx_rx_int_en.s.hg2cc =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   60  		gmx_rx_int_en.s.hg2fld =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   61  		gmx_rx_int_en.s.undat =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   62  		gmx_rx_int_en.s.uneop =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   63  		gmx_rx_int_en.s.unsop =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   64  		gmx_rx_int_en.s.bad_term =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   65  		gmx_rx_int_en.s.bad_seq =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   66  		gmx_rx_int_en.s.rem_fault =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   67  		gmx_rx_int_en.s.loc_fault =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   68  		gmx_rx_int_en.s.pause_drp =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   69  		/* Skipping gmx_rx_int_en.s.reserved_16_=
18 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   70  		/*gmx_rx_int_en.s.ifgerr =3D 1; */
92a76f6d8545efc arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c =
Adam Buchbinder 2016-02-25   71  		/*gmx_rx_int_en.s.coldet =3D 1; // Colli=
sion detect */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   72  		/*gmx_rx_int_en.s.falerr =3D 1; // False=
 carrier error or extend error after slottime */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   73  		/*gmx_rx_int_en.s.rsverr =3D 1; // RGMII=
 reserved opcodes */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   74  		/*gmx_rx_int_en.s.pcterr =3D 1; // Bad P=
reamble / Protocol */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   75  		gmx_rx_int_en.s.ovrerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   76  		/* Skipping gmx_rx_int_en.s.reserved_9_9=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   77  		gmx_rx_int_en.s.skperr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   78  		gmx_rx_int_en.s.rcverr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   79  		/* Skipping gmx_rx_int_en.s.reserved_5_6=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   80  		/*gmx_rx_int_en.s.fcserr =3D 1; // FCS e=
rrors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   81  		gmx_rx_int_en.s.jabber =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   82  		/* Skipping gmx_rx_int_en.s.reserved_2_2=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   83  		gmx_rx_int_en.s.carext =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   84  		/* Skipping gmx_rx_int_en.s.reserved_0_0=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   85  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   86  	if (OCTEON_IS_MODEL(OCTEON_CN30XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   87  		/* Skipping gmx_rx_int_en.s.reserved_19_=
63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   88  		/*gmx_rx_int_en.s.phy_dupx =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   89  		/*gmx_rx_int_en.s.phy_spd =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   90  		/*gmx_rx_int_en.s.phy_link =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   91  		/*gmx_rx_int_en.s.ifgerr =3D 1; */
92a76f6d8545efc arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c =
Adam Buchbinder 2016-02-25   92  		/*gmx_rx_int_en.s.coldet =3D 1; // Colli=
sion detect */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   93  		/*gmx_rx_int_en.s.falerr =3D 1; // False=
 carrier error or extend error after slottime */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   94  		/*gmx_rx_int_en.s.rsverr =3D 1; // RGMII=
 reserved opcodes */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   95  		/*gmx_rx_int_en.s.pcterr =3D 1; // Bad P=
reamble / Protocol */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   96  		gmx_rx_int_en.s.ovrerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   97  		gmx_rx_int_en.s.niberr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   98  		gmx_rx_int_en.s.skperr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05   99  		gmx_rx_int_en.s.rcverr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  100  		/*gmx_rx_int_en.s.lenerr =3D 1; // Lengt=
h errors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  101  		gmx_rx_int_en.s.alnerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  102  		/*gmx_rx_int_en.s.fcserr =3D 1; // FCS e=
rrors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  103  		gmx_rx_int_en.s.jabber =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  104  		gmx_rx_int_en.s.maxerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  105  		gmx_rx_int_en.s.carext =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  106  		gmx_rx_int_en.s.minerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  107  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  108  	if (OCTEON_IS_MODEL(OCTEON_CN50XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  109  		/* Skipping gmx_rx_int_en.s.reserved_20_=
63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  110  		gmx_rx_int_en.s.pause_drp =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  111  		/*gmx_rx_int_en.s.phy_dupx =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  112  		/*gmx_rx_int_en.s.phy_spd =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  113  		/*gmx_rx_int_en.s.phy_link =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  114  		/*gmx_rx_int_en.s.ifgerr =3D 1; */
92a76f6d8545efc arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c =
Adam Buchbinder 2016-02-25  115  		/*gmx_rx_int_en.s.coldet =3D 1; // Colli=
sion detect */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  116  		/*gmx_rx_int_en.s.falerr =3D 1; // False=
 carrier error or extend error after slottime */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  117  		/*gmx_rx_int_en.s.rsverr =3D 1; // RGMII=
 reserved opcodes */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  118  		/*gmx_rx_int_en.s.pcterr =3D 1; // Bad P=
reamble / Protocol */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  119  		gmx_rx_int_en.s.ovrerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  120  		gmx_rx_int_en.s.niberr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  121  		gmx_rx_int_en.s.skperr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  122  		gmx_rx_int_en.s.rcverr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  123  		/* Skipping gmx_rx_int_en.s.reserved_6_6=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  124  		gmx_rx_int_en.s.alnerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  125  		/*gmx_rx_int_en.s.fcserr =3D 1; // FCS e=
rrors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  126  		gmx_rx_int_en.s.jabber =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  127  		/* Skipping gmx_rx_int_en.s.reserved_2_2=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  128  		gmx_rx_int_en.s.carext =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  129  		/* Skipping gmx_rx_int_en.s.reserved_0_0=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  130  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  131  	if (OCTEON_IS_MODEL(OCTEON_CN38XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  132  		/* Skipping gmx_rx_int_en.s.reserved_19_=
63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  133  		/*gmx_rx_int_en.s.phy_dupx =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  134  		/*gmx_rx_int_en.s.phy_spd =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  135  		/*gmx_rx_int_en.s.phy_link =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  136  		/*gmx_rx_int_en.s.ifgerr =3D 1; */
92a76f6d8545efc arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c =
Adam Buchbinder 2016-02-25  137  		/*gmx_rx_int_en.s.coldet =3D 1; // Colli=
sion detect */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  138  		/*gmx_rx_int_en.s.falerr =3D 1; // False=
 carrier error or extend error after slottime */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  139  		/*gmx_rx_int_en.s.rsverr =3D 1; // RGMII=
 reserved opcodes */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  140  		/*gmx_rx_int_en.s.pcterr =3D 1; // Bad P=
reamble / Protocol */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  141  		gmx_rx_int_en.s.ovrerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  142  		gmx_rx_int_en.s.niberr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  143  		gmx_rx_int_en.s.skperr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  144  		gmx_rx_int_en.s.rcverr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  145  		/*gmx_rx_int_en.s.lenerr =3D 1; // Lengt=
h errors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  146  		gmx_rx_int_en.s.alnerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  147  		/*gmx_rx_int_en.s.fcserr =3D 1; // FCS e=
rrors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  148  		gmx_rx_int_en.s.jabber =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  149  		gmx_rx_int_en.s.maxerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  150  		gmx_rx_int_en.s.carext =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  151  		gmx_rx_int_en.s.minerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  152  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  153  	if (OCTEON_IS_MODEL(OCTEON_CN31XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  154  		/* Skipping gmx_rx_int_en.s.reserved_19_=
63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  155  		/*gmx_rx_int_en.s.phy_dupx =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  156  		/*gmx_rx_int_en.s.phy_spd =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  157  		/*gmx_rx_int_en.s.phy_link =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  158  		/*gmx_rx_int_en.s.ifgerr =3D 1; */
92a76f6d8545efc arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c =
Adam Buchbinder 2016-02-25  159  		/*gmx_rx_int_en.s.coldet =3D 1; // Colli=
sion detect */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  160  		/*gmx_rx_int_en.s.falerr =3D 1; // False=
 carrier error or extend error after slottime */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  161  		/*gmx_rx_int_en.s.rsverr =3D 1; // RGMII=
 reserved opcodes */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  162  		/*gmx_rx_int_en.s.pcterr =3D 1; // Bad P=
reamble / Protocol */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  163  		gmx_rx_int_en.s.ovrerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  164  		gmx_rx_int_en.s.niberr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  165  		gmx_rx_int_en.s.skperr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  166  		gmx_rx_int_en.s.rcverr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  167  		/*gmx_rx_int_en.s.lenerr =3D 1; // Lengt=
h errors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  168  		gmx_rx_int_en.s.alnerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  169  		/*gmx_rx_int_en.s.fcserr =3D 1; // FCS e=
rrors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  170  		gmx_rx_int_en.s.jabber =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  171  		gmx_rx_int_en.s.maxerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  172  		gmx_rx_int_en.s.carext =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  173  		gmx_rx_int_en.s.minerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  174  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  175  	if (OCTEON_IS_MODEL(OCTEON_CN58XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  176  		/* Skipping gmx_rx_int_en.s.reserved_20_=
63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  177  		gmx_rx_int_en.s.pause_drp =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  178  		/*gmx_rx_int_en.s.phy_dupx =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  179  		/*gmx_rx_int_en.s.phy_spd =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  180  		/*gmx_rx_int_en.s.phy_link =3D 1; */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  181  		/*gmx_rx_int_en.s.ifgerr =3D 1; */
92a76f6d8545efc arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c =
Adam Buchbinder 2016-02-25  182  		/*gmx_rx_int_en.s.coldet =3D 1; // Colli=
sion detect */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  183  		/*gmx_rx_int_en.s.falerr =3D 1; // False=
 carrier error or extend error after slottime */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  184  		/*gmx_rx_int_en.s.rsverr =3D 1; // RGMII=
 reserved opcodes */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  185  		/*gmx_rx_int_en.s.pcterr =3D 1; // Bad P=
reamble / Protocol */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  186  		gmx_rx_int_en.s.ovrerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  187  		gmx_rx_int_en.s.niberr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  188  		gmx_rx_int_en.s.skperr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  189  		gmx_rx_int_en.s.rcverr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  190  		/*gmx_rx_int_en.s.lenerr =3D 1; // Lengt=
h errors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  191  		gmx_rx_int_en.s.alnerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  192  		/*gmx_rx_int_en.s.fcserr =3D 1; // FCS e=
rrors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  193  		gmx_rx_int_en.s.jabber =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  194  		gmx_rx_int_en.s.maxerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  195  		gmx_rx_int_en.s.carext =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  196  		gmx_rx_int_en.s.minerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  197  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  198  	if (OCTEON_IS_MODEL(OCTEON_CN52XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  199  		/* Skipping gmx_rx_int_en.s.reserved_29_=
63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  200  		gmx_rx_int_en.s.hg2cc =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  201  		gmx_rx_int_en.s.hg2fld =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  202  		gmx_rx_int_en.s.undat =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  203  		gmx_rx_int_en.s.uneop =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  204  		gmx_rx_int_en.s.unsop =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  205  		gmx_rx_int_en.s.bad_term =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  206  		gmx_rx_int_en.s.bad_seq =3D 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  207  		gmx_rx_int_en.s.rem_fault =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  208  		gmx_rx_int_en.s.loc_fault =3D 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  209  		gmx_rx_int_en.s.pause_drp =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  210  		/* Skipping gmx_rx_int_en.s.reserved_16_=
18 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  211  		/*gmx_rx_int_en.s.ifgerr =3D 1; */
92a76f6d8545efc arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c =
Adam Buchbinder 2016-02-25  212  		/*gmx_rx_int_en.s.coldet =3D 1; // Colli=
sion detect */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  213  		/*gmx_rx_int_en.s.falerr =3D 1; // False=
 carrier error or extend error after slottime */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  214  		/*gmx_rx_int_en.s.rsverr =3D 1; // RGMII=
 reserved opcodes */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  215  		/*gmx_rx_int_en.s.pcterr =3D 1; // Bad P=
reamble / Protocol */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  216  		gmx_rx_int_en.s.ovrerr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  217  		/* Skipping gmx_rx_int_en.s.reserved_9_9=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  218  		gmx_rx_int_en.s.skperr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  219  		gmx_rx_int_en.s.rcverr =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  220  		/* Skipping gmx_rx_int_en.s.reserved_5_6=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  221  		/*gmx_rx_int_en.s.fcserr =3D 1; // FCS e=
rrors are handled when we get work */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  222  		gmx_rx_int_en.s.jabber =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  223  		/* Skipping gmx_rx_int_en.s.reserved_2_2=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  224  		gmx_rx_int_en.s.carext =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  225  		/* Skipping gmx_rx_int_en.s.reserved_0_0=
 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  226  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  227  	cvmx_write_csr(CVMX_GMXX_RXX_INT_EN(index=
, block), gmx_rx_int_en.u64);
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  228  }
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  229  /**
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  230   * __cvmx_interrupt_pcsx_intx_en_reg_enabl=
e enables all interrupt bits in cvmx_pcsx_intx_en_reg_t
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  231   */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  232  void __cvmx_interrupt_pcsx_intx_en_reg_ena=
ble(int index, int block)
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  233  {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  234  	union cvmx_pcsx_intx_en_reg pcs_int_en_re=
g;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  235  	cvmx_write_csr(CVMX_PCSX_INTX_REG(index, =
block),
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  236  		       cvmx_read_csr(CVMX_PCSX_INTX_REG(=
index, block)));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  237  	pcs_int_en_reg.u64 =3D 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  238  	if (OCTEON_IS_MODEL(OCTEON_CN56XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  239  		/* Skipping pcs_int_en_reg.s.reserved_12=
_63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  240  		/*pcs_int_en_reg.s.dup =3D 1; // This ha=
ppens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  241  		pcs_int_en_reg.s.sync_bad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  242  		pcs_int_en_reg.s.an_bad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  243  		pcs_int_en_reg.s.rxlock_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  244  		pcs_int_en_reg.s.rxbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  245  		/*pcs_int_en_reg.s.rxerr_en =3D 1; // Th=
is happens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  246  		pcs_int_en_reg.s.txbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  247  		pcs_int_en_reg.s.txfifo_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  248  		pcs_int_en_reg.s.txfifu_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  249  		pcs_int_en_reg.s.an_err_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  250  		/*pcs_int_en_reg.s.xmit_en =3D 1; // Thi=
s happens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  251  		/*pcs_int_en_reg.s.lnkspd_en =3D 1; // T=
his happens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  252  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  253  	if (OCTEON_IS_MODEL(OCTEON_CN52XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  254  		/* Skipping pcs_int_en_reg.s.reserved_12=
_63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  255  		/*pcs_int_en_reg.s.dup =3D 1; // This ha=
ppens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  256  		pcs_int_en_reg.s.sync_bad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  257  		pcs_int_en_reg.s.an_bad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  258  		pcs_int_en_reg.s.rxlock_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  259  		pcs_int_en_reg.s.rxbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  260  		/*pcs_int_en_reg.s.rxerr_en =3D 1; // Th=
is happens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  261  		pcs_int_en_reg.s.txbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  262  		pcs_int_en_reg.s.txfifo_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  263  		pcs_int_en_reg.s.txfifu_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  264  		pcs_int_en_reg.s.an_err_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  265  		/*pcs_int_en_reg.s.xmit_en =3D 1; // Thi=
s happens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  266  		/*pcs_int_en_reg.s.lnkspd_en =3D 1; // T=
his happens during normal operation */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  267  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  268  	cvmx_write_csr(CVMX_PCSX_INTX_EN_REG(inde=
x, block), pcs_int_en_reg.u64);
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  269  }
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  270  /**
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  271   * __cvmx_interrupt_pcsxx_int_en_reg_enabl=
e enables all interrupt bits in cvmx_pcsxx_int_en_reg_t
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  272   */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  273  void __cvmx_interrupt_pcsxx_int_en_reg_ena=
ble(int index)
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  274  {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  275  	union cvmx_pcsxx_int_en_reg pcsx_int_en_r=
eg;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  276  	cvmx_write_csr(CVMX_PCSXX_INT_REG(index),
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  277  		       cvmx_read_csr(CVMX_PCSXX_INT_REG(=
index)));
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  278  	pcsx_int_en_reg.u64 =3D 0;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  279  	if (OCTEON_IS_MODEL(OCTEON_CN56XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  280  		/* Skipping pcsx_int_en_reg.s.reserved_6=
_63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  281  		pcsx_int_en_reg.s.algnlos_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  282  		pcsx_int_en_reg.s.synlos_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  283  		pcsx_int_en_reg.s.bitlckls_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  284  		pcsx_int_en_reg.s.rxsynbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  285  		pcsx_int_en_reg.s.rxbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  286  		pcsx_int_en_reg.s.txflt_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  287  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  288  	if (OCTEON_IS_MODEL(OCTEON_CN52XX)) {
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  289  		/* Skipping pcsx_int_en_reg.s.reserved_6=
_63 */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  290  		pcsx_int_en_reg.s.algnlos_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  291  		pcsx_int_en_reg.s.synlos_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  292  		pcsx_int_en_reg.s.bitlckls_en =3D 0;	/* =
Happens if XAUI module is not installed */
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  293  		pcsx_int_en_reg.s.rxsynbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  294  		pcsx_int_en_reg.s.rxbad_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  295  		pcsx_int_en_reg.s.txflt_en =3D 1;
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  296  	}
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  297  	cvmx_write_csr(CVMX_PCSXX_INT_EN_REG(inde=
x), pcsx_int_en_reg.u64);
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  298  }
80ff0fd3ab64514 drivers/staging/octeon/cvmx-interrupt-decodes.c            =
David Daney     2009-05-05  299  =


:::::: The code at line 49 was first introduced by commit
:::::: 80ff0fd3ab6451407a20c19b80c1643c4a6d6434 Staging: Add octeon-etherne=
t driver files.

:::::: TO: David Daney <ddaney@caviumnetworks.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7368936945091470191==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICEPSqWAAAy5jb25maWcAnDxrc9u2st/Pr9C0M3d6ZppGL7/uHX8ASVBCRBIMAMqyv2AUW0l1
a8se2W6bf392wRdAgkrvPXMmqbCLxWKx2CeYn//184i8vz0/bd/299vHx++jb7vD7rh92z2Mvu4f
d/8zivgo42pEI6Z+A+Rkf3j/++PT/uV1dPbbZPrb+MPxfjpa7Y6H3eMofD583X97h+n758O/fv5X
yLOYLXQY6jUVkvFMK7pR1z/dP24P30Z/7o6vgDeazH4b/zYe/fJt//bfHz/Cn0/74/H5+PHx8c8n
/XJ8/t/d/dvoy/zrw9lkej87v9/O5vPt7OvX86vZ2Xg6udpdfhlvzy92V/OL6fbfP9WrLtplr8cW
K0zqMCHZ4vp7M4g/G9zJbAz/q2FJ1CcCY0AkSaKWRGLhuQRgxSWRmshUL7ji1qouQPNC5YXywlmW
sIy2ICY+6xsuVu1IULAkUiylWpEgoVpygaTgDH4eLcyJPo5ed2/vL+2pBIKvaKbhUGSaW7QzpjTN
1poI2BZLmbqeTYFKzRVPcwYLKCrVaP86Ojy/IeFGDjwkSS2In35q59kATQrFPZPNJrQkicKp1WBE
Y1IkyvDlGV5yqTKS0uuffjk8H3bt8ctbuWZ52G7shqhwqT8XtLAkGQoupU5pysWtJkqRcAnAhutC
0oQFNqtGoiD/0ev7l9fvr2+7p1aiC5pRwUJzPLnggbWODZJLfuOHsOwTDRWKzgsOlyx3lSDiKWGZ
OyZZ6kPSS0YFEeHytk88lQwxBwG9dZYki0AJKsrOVESPuQhppNVSUBIx+6rZ24loUCxiaeS9OzyM
nr92BNudZPR7DQcLqpT0aYagYyu6ppmSHmDKpS7yiCha3wu1fwIL5DtIxcIVXAwKJ2VdyIzr5R1e
gNQcUKMkMJjDGjxioUepy1kMxGVpHc/QEGolSLhy5NOFlKLs8OAszhZLLag0whHSZqCRam+j7fRc
UJrmCuhm1MN8DV7zpMgUEbf20hXwxLSQw6xa3GFefFTb1z9Gb8DOaAusvb5t315H2/v75/fD2/7w
rT2ANRMwOy80CQ2NUkbNyuZ8XLCHCw8RVAebEKqh0aqThAIZ4X0OKZgKQFQ2hS5Mr2fuGdQikcx7
Nv9AKkZ6IixG0qep2a0GWKsh8EPTDSikpbnSwTBzOkNErqSZWt0XD6g3VETUN46qWwPaE3NBGg2D
TgOvSNytNnZlVf6HZWlWS6ACSm+5YY5eJAYTy2J1PbloFZJlagWuJaZdnFkpX3n/++7h/XF3HH3d
bd/ej7tXM1yx5IF23DTQn0wv7S2HC8GLXPpMAvgrmYMoLM4LJXUmHd3MQxjxTAenJDq4OYv8uOGS
hqucA3doJBQX1J4mARwZb2x49SoumNtYgq2GOx2C8Yw8iwiaEMurBMkK8NfGYwsrRjK/SQrUJC/Q
qrXeXER6cWc7NxgIYGBqcwtjyV1KvFwCbHPnYw3ncIducjd3ft9JZTEZcI52y9U0OGOeg51gdxQN
Mpp7+CslWeiIs4sm4T88PC3JmmIMGeEdCDncIvBKRFMMtjLiuv9/jsZFDl4ZohxhjaOvVAnYg5Dm
ysTfeANbeNdQpBBSMdQvi8SCqhRur+753VIzesNxGRy0AzmXbFP5J2vUXMnub52lzDGvxcJ73gGR
IOMiSTzyjQtwoRY/+BNuiLXrnBuGWx1ni4wkceRdyjA+ADPRRuy7E3IJQaW9BmHcS4JxXYiO32kn
RWsGG61k7LvgsEpAhGD2ka0Q9zaV/RHtnFQzaqSJt1ixtaPRQR7Xiw8YIhOFx9YFWoUmm2hvpqSf
PXOBbRpF1JporgXeLN2N4cwgLKbXKTDCQ8fyhZPxvBegV/lovjt+fT4+bQ/3uxH9c3cAv0rAoIfo
WSEiKsMSa41yYa9T+ocUW4LrtCRXBkGd0MxKpoiCTMy6BzIhgaObSRH4DXPChwAkAL0QC1pnST79
RKQY4rSESfANcGV56jLRQpdERBAWRA5byyKOIQXICSxjToWAd/HGgjxmiRPkGiNknJIT/Lt5aqPg
LJd1CJlu73/fH3aA8bi7r2oMDUeI2IT7KyoymnjFY/BIAq4vvfVfOnHhH1fL6dkQ5OLKb6dsrvwY
YTq/2GyGYOezAZghHPKAuMfbwiGVhfMPpTK+YhjnE7m7G4bCwdEMBCq5n/2EQNT8eXh+wnm2kDyb
TX+MM6Xxj5HO58M4OWgr/D1gaY3EwIIofwhRUQhPcboW88nQeSA8A52mcJUGmBQELsJqeDpExYmi
Ky2UX3XlAtLxfOpnsAL6dbcCXp4AzsangANrsuBWUR2KJXPzxx4GEenAfWxp8NM0foggIfhJTyEk
TKmEykKcpAJGm0u/jlQoAVsMEsmYHmDCHLHazK5OaZDazAfhbCW4YqAewZl7HrU7IWtWpJqHimJV
z3WUWZLqTSIgwAVr7qVfYuQnMKoFwgytUj75IQvhOpV0YeLg64kfBWs2OplasbYPrFXiOEU/UhPm
nmK+MyfhNzoBR51gBkeFKHK/OfXP/v/MgYgtzG89sqvwWJLaXrHv87qlreUNZYulFcU3NS8wN4GA
pA38gJOhlXkfT5kCJw/JqDbO2A4hQ7qGqGBuxSVYOtSyyHMuFFbSsL5pxWgQJZo8mBKR3PaCe4Q2
c5dc5UmxwNJMN/qDCLTLawuIb8ridJhGbjm8RSlla0E4XHeYpe+4PcFhB+JeDF6wbG7tPy/wlmsw
5ow4JSOElHakAvqCK5u+Q8aH4FAbklkBaVgSxJbEjTuTOZxfZyyZwMnDCZcVDn1xEnx90VTnnLDK
2q2jxv0TP4FyQ8kKEtOIirqA11a9PAqNlJBFYZkDRSCOVZpJAge1vp56pXM+D0AvypjPPcP/CwrK
GMPZrozzBeTf47o0a6udiMDj0LKz0MSzdgLy9v1l1wrT8NAhviagILD4/NLKdzCmRqOp5yvH7LWA
yfnKH/y3KOdzF6VOh7GgDL5mY+6EOZzrycQWCB5qLmhMlWmGWJDasERFmndNstlNnNfi9PkGoJBR
GkmsYsuUCGXmcAFzQ8GrQL/DSMQo648KtvGMytss7IiXSBZVij7uA1Dy15d+ZQCTWmbwtv2LwcjA
KNxV11yUxjEnkOz6wF4TUw2aqkzZs0M3Of57PJ6PTQPRChsxO8MzxUTdH3ak+Y/skNPlywRuVzZt
tPN5R3AlAv6VklxPxtN5p+Ux9Ye4AJlfeliB8cl43KExGQhIkfyZPxw1oPMhECwxOA338CMZEYFW
wnRYmonXE/ssVnRD/ZlQKIhcmqvhL5VoHltlxoIlCvxSpPqXCG4HyXNwB+CjAe4r+iAaTWIHr0dH
kJtBQp00svSoEAzw9NSSNR6gQLCFmU5vUYcUFlMTjjX6UzUVYyTbCn64imhjRix3A5ndqmwg9GD5
orxBJpCT1/PSBgfvr6PnF/Qwr6Nf8pD9OsrDNGTk1xEFd/LryPyhwn+3BhqQdCQYtqmB1oKEViiR
pkXnvqd4M0RWmhHYfXY9mZ5CIJvryaUfoS4E1YT+CRqSO6vx0JbrKCWzqe1m/7EE7FOeTat17K6k
+7vqrbfjjg4AAe7NTypgZpg0R5Q//7U7jp62h+233dPu8FZz2x6JEcCSBeC4S1uZcwlZWN/4FhI1
3Qa3xrGE+YpTTok2T8uetBdRh4kV0N58hpVuqNA0jlnIsM5XmVJb/oPba0KuEiNtMADQwNjD484u
cKE9xj7yUB+xmmCP9MgbevH++PTX9rgbRcf9n506aMxEaoIa8GOgdl6bseB8AbetRu1VX9Xu23E7
+lqv8mBWsdtpAwg1uMefE+iv1pZXxh5vAWnOXachUka6cGMIJF4sW+l1JPl150HM9gip1RsEoe/H
3YeH3Qss79VBCQGoHXl/wvAnIYEdSZoyG9Yd0Z2Aacb3MZ0MpQxBgdlFhl23EHvGHS1GN1G7hkDe
kLxDgnFB0RhA9tWlvupmZOWooMoLKPss9ohhwBjYJeerDhBMiwmA2aLghed5BQQXRjerNx+dbWFw
BnGnYvFt3fvrrC1TnfKoeh/U5VXQBbhmuNzGB1SSA9fW3QG2Gnz9BJzvGzeN1JImum2fPHxHbQA3
BK482kAT9DVvvzxIldE+gdsuJ2mI6CdAcOuSMlNvzVsJGeo0mg2iwtBQcXHtOlR7vCXoQOCn4N53
EYni5uFIh91w8HWLAYMWwCwnxsLh4dcazgXoP9gYUOMMw3G0y3Va18EDdavDdhqy2H7y0KxEN3Bh
eVY+q0KhePQaw7AmQPfx4kQBHQSzgPfKuLPawMJD14oKhojYKJd9Fa2zAMXziN9k5byE3HLnPWKC
MUYAUgCjH9mpWkl8NkXzhofjkVK+BLsI6gJ2xCej6lWh0FbCaeplVgutK7sy3arbk5Cp+C7fUGPc
Pr4QjGobypQeIuTrD1+2r7uH0R9lkPpyfP66fywfKbWOENA8rabuGgat7IPRqgPbNr1OrORsF5+z
YtmMZd6m2Q98WZN0Kp1iP9z2B6b7K7G1ej2xIjkeFQn1tpxLCFwyiq9p+KpwGr4BHpxPHDKbtIsW
WfmoFY4RfF2R4SSPMzTPNSODhBg+f1mhiJsawZwQ/Xt3//62/fK4M++YR6Zr+2Y59YBlcarw/Hua
7ANVemJJrUSSoWC5+yKsBKRMDuSJQKabJTbHOcR22f7cPT0fv1vhnCdUqWsQlp1vyhJljNK5RjGR
Si+KvCPZFYUkDB8XuAcj8wQuea7M5cQKAiRbtvA6r1dNNUpQzNYcS52yhehEbMZCkCgSWnULZcY1
gPEI7MhjJa091gbMGC5IoAyh6/n46tx6x+HxCb7HWRSUCcID44tWqW3/KMlM5dQpB7sPkup0LOfc
ihjugsKy73ezmNtvx+9k/1lDPWbOzLOAibWMdC0vaz9mMMUsmOu7wHDa2o1PWzuNDTB0iMSxUsOa
Z7WPqI/R0s3hO5JPrDGv0e7P/b2dfjihWWjFdd0f1ZNj9/Eb5F+oYaAevswNoER2Er1q7MT7iAbF
pHmSuO9iXCgWJEocf0m2QW6fjQ0iwgmkfnbwMbYri6HX2TWsLFmCHqHTli78c8HEqivG4fQXYFIV
gUuDhqQrVshQ1kN7w67QMAwLsgPngBdfqyLDElrcPQYD9JxjHwlff57G+EcHVCJSMcU//MXGqsEF
6L3cGMfunw9vx+dHfE760L0CKItYwZ9ltdQaxS8d2tfnXUDv3a7hdYMvbzadQVNtx28JzMz2Tr7u
vx1uMO1GHsNn+A/5/vLyfHxzuINc8KZDMLqpKXVGsSfnH60nODqQUtnt3Vb25xRzpWt8/gKC3D8i
eNdlvjVjw1hlWLeFoOl+V4LbU8Kn8z5BhCSimZ3L2qM+kdQgj1xsUH+q/nQxnVDPUCvHuurzwy00
xSm/JjZaSg8PL8/7w5vzSg5vfRaZXpf3oJyJDanXv/Zv97//UO/lDfyfqXAJiadTRjtJwvLFm0QP
OYGQ2E+RyzJo97fGWrUOmWMWcWKHaLWvD/fb48Poy3H/8G1n7eQWAgxiUzADmvtf0JRAuLl8eQKu
/IazAnK5ZIEvDMmj84vplc0Lu5yOr3y12VJCmM57o0RBchYx+yH1wICOIO41WSAmjzOni1UilM0x
LTZabbRpuwy8laropQSmLJj3+5QGCf1WnxeaFSmmN/Z2ali4TN3Gfg1IkScdRnTdO3Oxfdk/MD6S
pTI+9MunNREl2dnF5gTHYS71ZtNnCyeeX/r4CsuHhL7Dq1HExqDM7MszwHNbCN3fV4HYiHeziaJM
v5c0ye3HIc4weG61dD7MW6s0j507VI9B6lhk3teoimQRScpaUmttRLlQU5M2Hwj2TqUpFz8+g/E7
tuzHN7rsPllp3Abi5Yag84Vig13WBcvdeVWzxcScR1DpfzLc5asJthN8dIRfSNSpoCsrUOWqC+Vd
vUKga0H9N6dEwAC/IgMZWMrX3u+7Uv2ZS70q8F2NmxKUYxWBnHagzRMjLNgVinc+dxR0kdrF6/K3
ZtOwNyYTljqJXTV+M+kNpaljcCqa9seHaCzkEk42wk98YrdOisDYOFlT5fae2cCNaPqJDyZzca58
IMJUqkAvmAywgXyizRqlQ88T0xzzubTrvtr5S9aHWV2+mq/mfDK7t4C/NCh1ndXZwyl+F2VAvkzR
TGQibmfbkCLY9ACp+ZqmdJHb49seBTh62R5fHXcPWPjOGividmEPh+sOsgfE42a0lQyMw3mb73YM
0B+X9FgxHBav2B57xk+7yof86rg9vD6a79dHyfZ7x7obHng+cEQARAYY1jVAAVMilXuFSx9C0o+C
px/jx+0rxDO/71/6wZARQ8zczX+iEQ079wzH4So2Xxs7zAAF/IDEfJPEvV+HIRbeoYBkK33DIrXU
E5d4Bzo9CZ13DhLWZxPP2NQzlimaOK+rmh2kUfmBVm9v4DR8QU8NLhRz1VK7T+VwgHcGSICvfx33
OXxc1ScJLy/7w7d6EAt2Jdb2Hu5j90w53vMNyi1n2aKnx1gDG2q6GnjojwNLGIawA/Iw4tVrAfGd
cHeM+YYgnRenp7dUfi+5e/z6AaPx7f6wexgBqcoG+bU5T8Ozs0lvv2YUP/KK2cCb5xZrqDaBKDLp
nW2+FG51wiisimC0dyej/esfH/jhQ4i7HCpO4fyIh4uZVQM2rQuImHV6PZn3R9X1vBXrjyVmeMkg
EnIXxRHtFp+NIcooQryD2GPEZuuNYKpnF2qcU1+l2HhcDWtkjTPdoA1adITr3L0bXbFbhdJ/fQRT
vIVU7tHsefS1vGFtyuqRAuTIJOnYRQvglgu7wEh1JVFKtlMW6sLRv1ec9yenmxMCLKWcD32OUmPg
FcSy0ykmeqWGBkIEkfaz4QZQ3vlkkdYiT/ev965MZdorKDXT8Q/nn5JoICZZ9YmZyRXPqn+kor/N
Fly6K/RNWGnzVf1OTYow4LZec3pQg0DVml82g8IQbuE384y+W8lp5gOSl28Yx8rEkkD46W2DdzGD
6t8QqVs6nsVrmLnshsUkh42N/qv8e4rvtEZPZdHda08NmnsGn1kWcysSqJb4MWGbSBF0LhAM6JvE
9KjlEtsWpqnSQQhoUP1TMdNxF4b9JScXqAGLpKAB64p8eQtZl7+IEykre+BOIRgCQ0xXBv5RGoDi
w13sV9oEqm8VvKAVDz45A9FtRlLmMNDooj3mpCMc355AgLzGcNDuyZUAnqzdVSFJE87HDxBPdl46
lgOabC4vL67O+4DJ9HLeH80wOA7r65CtU+orjzrjjcmwcp46XaGZ5PhEkslZsh5PHdNIorPp2UZH
OfcdBWS76W0lpDbPX5JMcZ/9UyxOa9fXNvJw8GKz8X1/xEJ5NZvK+diJNcB0JlwWAj/uEmsWDiTO
S8gmE98/TETySF5djqcksQ6byWR6NR7PuiNTq25fS0oB5OzMef5cg4Ll5OJi7Fm0RjCLX4039uRl
Gp7PzvwVxUhOzi/9Jb4liNpu4kgnarKLu510v+wjaBnF1HlhL0P9H8qupMttHEn/lTx2H2qK4M5D
HSguEp2ESBOUxMyLXnbZPeU3LtvPzpqp+feDhQsCCDA9By+KLwgE9gggEOAWFxCtv/b52bEonhrW
8L8eq6f7heGGcuGbtwfUDF7xiY3as7ei3/MR+qfPZOXDi1TFjNN8itMk0raHFD0Liim2qNzGuafZ
qa9ggWe0qojnGT7xywoAhV+SLQ4J8azeraguZVdD7zljF6psu2Vkjx//fvnx0Hz58fr9rz/l7fQf
f7x859rmq7BrRe4Pn8VC9IGP60/fxH+hW+b/+2tsSpi3ebYZQTis5cJc69E9hup8ew9DZfHfq1Z0
r4ahE1tYhZgdn37TdpSr4oSGESvo/foIFhbRUfO2EKE7oAll9mRDg1zJvLvqO+Lc6M3veQOsJn2q
BHvnTbkqIqxgzaL1W31ZgMK5Rk8V+0DbiLww47ajCk9WVdUDCbLw4R/1p+8fb/zPP+3s6maobo1u
VSyUe3fSa2Elnzv2pAu3m4+S5Mu3v16dBW7OIOCd/MnHrO5bpmh1LZbPFqy1ClHOLY9AwVAI5XZt
M83IutnzWURY+iRiNfz7Baxp80fdhVVldQVHJgC59yy/YBv7BhsruEpxvk+/iWsn+zxPvyVxClne
dU9KCkCtrihRHX1o9e2yYNUHfPaVN3y1rd6ZwtduMHA1eh9FPn6zBjKl+IUegwmPlbAxjY8HzCpY
Gd6PxIOrKYCSNyR9P/okfoOnlF7jZTPEKR7zYeVsHw1pbRanDQg47iIsDWoOrWxjkcchiZGm40ga
khStEzUU3igFTQM/2MtbcAQBkjVfRZMgyvCsC0yT3+B+ID5BvzxXt9Fxk3vl6Xqu2XUD6qW4MrGc
sovufLZVOrdn6oadrIAz27djd8tvuka+QZczb3cE6PiUE6JFGql/H7tLceKU3Va+taEXeEja04jn
WeQ9Ifpx4orwxRBrsvHx3gNzRpuatPVP/OQzHgjDtRL5iuraCl9ZDk/40Ng42u7Y8H97xx7Tyse4
AcaVneKtHFe+O6PO05SVu3iyzu8sHulhJ7VipGbulYiAUuk3ZW1MiYJXothwrtoGCx2piSB7TTPi
SdQitqrIZzcNBo/ZFGAfCil63vdtJXN1psl7VpQloZli8ZT3uUkUFWGqhRARf3baamWzGhWwXdk0
TXluZ2POwLAS1i6DirjBhtFiLtlMxKXcir5Q7lxZ5L0cAwJgOm/0EusOGtwgiRXdYcgR+rH2MaGO
gx5vD5DvFEUuDV+eqH7xaMVk9Ii8wCDG1d9bcy7hWewKj7TE231LW95Y36uPmwiA1uHp0/xYtS0a
pWETUcRi7IYDmoAED3gAtI1JuDfrfgZb+W5NyX+gST+fqvPpgp3ZrCzlIcOaIqfcHDpj2V2Gg9iG
rye8Y7HII9i+ycohNM8L2v5Tn+O9VQBcRd9LVbJAzX7F+mkoEHLNmjwGTaLGmbzpi7pEK1jMWUqx
3hLViGKDVMQ8bCowH+scadrTNPYwJV9ny8skTTI8E4WZ0wnkwIY44Bi46UCgzwTAR1q1d6qfmQL4
whXKZiqaAccPF594JNgBfUfhxBa7uArUFOc0IKmD6SktRpqT0NvDj4Q48XFkvXHshTA4q0fh4Zsp
hHutJHZ9eYd5o6VOOe3ZqTF2KTWGqnI48AGmY97muJZusyEuGzj3VARGTASEq768a0Z2wavp2HVl
M+HYiU/uVY9jTdvwTjS56oTF7CmJsbkIZH45Pzuar3oca5/4iQNtc8cEULUdDtzyoqP3W+rBzWOb
xVBVED5uEhGSegTPiBtFkQeDYQCYMkLw6BqArWrrXIQL6LGwFoBT/nC0Ep3iS3sfmXMMNOdqQpUn
kMVjQnzHhFud6RwHHO+i5Xivx2jy8KgeOqv8/yCCXf0cK9c73mYULiZBEE2iDt7kVjPqG5VxK8c0
maa9ieXGjWny1grD1U3pMtIx4xQfdiYSJCkedNxM7CenGMHa52c+J/yEgAF1SSbQBr3NYskl1Za9
dOQ88BMplbQQ7Uicg0sKNViWjZu3VDEZfyJv6U+Rt/dltLkL040dbu6anO+ED9nbvVLWIXpyZXH5
zZ5kz0/irrfj9MZuNa5uFWGEW0Umt5xF8BlCJpazp92Kk/9vRp9gm1SAkRVydXRkxmHf86YdvUBx
hE5BJJy8IcVA76NTw2RNW+XYRh9kYm7tho3EDxwTLhtpre9mAWxK48hdtJ7FkYf6retsz9UY+75D
dXw2XqwAldKd6KxbBs7l5j2LHAEwQTYiFKBjU3PeyzIu4M7gQJvQOnSTRHxZlxCj2vGPpNT6we9C
MfudpPvlfDpm8hNiUXyTEniWmHWArfczlJsJRNFyNnB6+f5BuqM3v3YP4iAGnOgDueVP4Tygdhu1
M2tJL8SGHXpiLeC2ORg7hoo+5DfnN/MRofoOZsZ8ukTVgZ8Mxd0Qw+ToD3tyqi13PceLUQ3CzIbu
FwvlfmZRBDbbV6TFWmdFK3oh3iNBv6wp1xjRA2Ss6dZDOOyITTkt//Hy/eX3V3FVyvZaH0dsC1pZ
FfJuAtgslPE89f2Ntpcujh2I89/D46meNvNDQYNBVXE+c3hNSiHCd0Dtx2MmvmDhmTRFpbacavCa
gYT1S7KKwJraIMmAjWV3tLMX13k7dC+D44edvE83K4j6SlJPCDQdcAHa0EMeBgQDzHCaGyJuxOs9
dUOKYhzgZfANm5r+xIcZ6uDSt03Rra6CszPx73s9SNwXo/n5Hrpi7m0MoSO0dDH44YT2eKcAi8S8
JYwHFjjlkZNwn5jq6ghKORb8T4+3Grw0Ljkb/EBhxuQOdTFEqL2tscitG22J1KCGU86g1XX0fLly
3fFsiiXTc+R5HcXN86Gbnuwk2RgEz70fuhGogUxN2z4ZJxkLTV5jRWRY8dljb7mn6mzZpfaHCxu1
CIJL1xSrtO1JoEspKkoecwmHSDDE/SVkHa42CFi+dXDFxj9H6WVaxKB/fX799O3zx795CYRI0nUc
k0tcCVJrDU+7bauzHoloTlTiGFVlaJBbrnQHXmwDfZFnUUjMIm/Q385yS57mzCcPrB8tHEN1hLmW
lfYhli9tp6JvS3SM71YhTGq+auh4N3A9F9L7SP75P79+//T6x58/jOZojx2ILrIQ+6LGiLnea42E
18zWBVrcxdp6wTyXPnDhOP2Prz9ed+9Aq0wbEgWRKQknxoFZwZI8YfaQRGmZREYv4bSU6HqnnHLA
RpWkMGiHCVrfNBOm2shpSer8PkzkfG3KJued+ALp3K6JoiyyiLF+4j3Tstjo/1f91vZM4JMbmBzk
u2EP/xK34uYbLP/4k1f95/99+Pjnvz5++PDxw8OvM9cvX7/8Iq62/BM2QiHmK3tMlpV4KEjeRIXW
owGyNr+60cWxzaxgnQV1UhNM1dH3jL5b0epqVP0sOkheTkHLU5rvZGQ352zQUPw5IoG9ew6TFFvg
BNhJbwwoDB9CzjIPjwHqSyVbn46VMaubCpGgrSEu5rBPfEn58vJZ9IRf1bB7+fDy7RUMN1jtTSfO
li+o8SflX32woejdoRvry/PzveMKpuNb+dSe8h2U+Xavf6jJbpZN66SmXLXjwUDndAMqz+6BkjQ7
q2KIcPgVPvRmvxWepqa5vCFijnR2FcXiuraqL+TadwG++cR6/ASFcbUdqfyTbgbwH0AhUOYwa4zL
Rhv58yfh/aq3iEhC6AZIVr0etpz/WIMRqNm/Z0t6SBQRcSm4ldFjH6WNABOaIfsSwIbNI33Nan69
+et3exkaey7I19//ywSqLzLcWH96Ek/dCv/IczWK14XFdURpurAxp+K+4sPrV17wjw+8E/NR9UHe
p+VDTab64z90T2I7s1X2VVdYzN/5JvkM3NWriVphmzPQgjR+oWDUl3MxwpihIiX+PzwLBWiGgeii
bs1nkSpnQeKDTY0VmXrfwx0aF5Yyz7wY9cifGWjR+wHzUqjHmqiNMN4owAJf6BOJvAmhj7RGyH3e
0pxhhZtff9oRvSuqVncJWYVegwwxvY8OvH/+ePnx8O3Tl99fv38Gk99y49bBYuUgrILczrlgYdIS
Tb8Q+fOubRHk1SQRvWK+uxRtUTa72lj+l0+a4b15wU11IYeDkVx15UOJMC0ZXwQh3a/EoFqBnSRV
+lx6mzWibnT9+fLtG9dupCyWdim/S8JpMuIoSLragDMFMi8dSmp5y3vgl6E0i1H84xHc0tdLgt53
NDgHp8esxE/tDds9l5jwJyyuVn0d0pglkyU2rc7PxMc28yVsKhyqOXOaR6XPO1x3uFgpcmWgQWNt
LF2hsBK8FWUWhLZwSrVxJcV1+XsNrxrudINVPZbUj39/4xO93T1mH25Lkpkuur9TnPLcW98dRbQv
Z1OpTuzZjSLovrPg0pYN7Oqa6aaQCJPDQXxmqFM8dI+Ex74p/HQ+X9Q0GaNa1aisy5+obv2+mKIO
zXN3NgfjoUy8yE9tKkl9u8EOJS8loTdsJ0ONYr4mybMB+N27/Px8Hx3Pz6nx1QdZiB83z3iaoEr9
ikaxna+azPc6ShJHdk9RK5e7rVgc+cSuHQlkBD88UBzv6ZTiDgkKVy7arpzV8b45zDkxAh0H6SBr
zLTdjnMY08lMvoc2+0xr7jIyFIndo6mpFA+8QifBoSwCn7i2aC0h1TUbdrCFX79CUAlfP31//Ysr
kztrV348DtUxB0HMVffoiiUG8ZwLmtryjYwsJDMlv/zPp9mKoi8/XkGWNzJHcJHXJzqttjekZH6Y
eS4kBfqijpEb5hWxcZj2+4awI24VIiXRS8g+v/w33L3nSc5236lCQw+sDAwcW6xkUUIvMqTUIOwR
IMBBAvfHWG8FHPrpsw6kXuSQFZ6kQgjzQoMcjuw4cC9091UIpjgAdHMdSFLPBRCX9GnlYdtykIUk
+uiAnULT+mUwW3FjHY2Iu4S67VvgzqzT7XurONvpRjvMJbsvc8VoG295WdwP+TiKO6AryBeGNPMj
8xs1/cpY9TA2+QxIdlRKNUfbDDMsg6oZmc1CrW7DGyI2DI5i25ov815M7E/yYkyzMALHoAtW3HyP
4FfPFhbRMWJsDdIZ9C4F6Ig8ku5j0rgNwYWDHWDYzLnsnIx8RPNzPqNYbof3fjJNmBKxJMvVFxJh
JVvoa5rSPkeaXIO5YltfqvZ+zC/64cySpnDmTLzQwySdMcy4Byw+mbDa2XE1X1i4Pso7TxBgnzes
F7nvfC0HiO6qsgDWHbMFEBqa7lSr09PUpkM7ectXNjCSzBjEEcHoRUhiv8WSmkgYJYhIZTW/UCJZ
YnnYYdXRojvuVxJnydAq5l0xJNFeA0mODKlJAfhR4ko1CaL9VCOer+PjiDfqGx9nKS5SFE/IFMXo
IQiRKp5V6MQeFXKwiGbzsxCZSpa7lXaSw8invMimXwpGPM9HhDYtnw3IsizSTq+HczTGJDVnaLna
GD/v1wa4NinivN19aoB7pgqa8vLK1Uhst34N1FEmocNvG7BgmtHGQMWtj01YCEQuIHYBmQMIHHkQ
faBpQObDCXCDRl6k3fglkgPNjgOx70x1PyqK5IjQj0/jvkAsSJAYLTkrkhit+klEMTrLd42GrkWz
ZH2F3txeGcapR5Iu+F95I96aGDos3QXv2WUn8ZLFWNAZEQgGK49t+i9IEz3ec4p58y4cdUK4il3b
iQog9esjlmydREES4Z4zC88RddZc0NnJfQ5QYH7aRiRlFMuZQ77HMPNm5eAaVI6kmcQ+QlVnqGcb
OTWnmARIIzQHmleobBzpK2xhWRnETuc8ddlfj2myW6HvClQrWWA+RQ7Ex7qNCL4KnstaATnXI1OQ
ApB5YwbgsQYAM3RSUZDLt3Pl4QszeZPHdyjRgMffqyrJ4Sh36MdYFUqAYEUTqoq/33KCJfbifbEl
E8n2xozgiFNbOgFkiUO4gCTotpbGEse+q2hxHLwhUhyHyMCSQITUpAT2hEX1oG3a6AMPF3Ys4gh9
DnjBe+YHaYxMn7Q61z450MLUK1aGIeGzToB0Cxqj1CRABwFN3ui5NNnvSJxhT9doaYr1XW4Bo1Rs
ANAUbZqWZg6Pz41hd8TRzFElWeQH+yqW5AmxHR3IgS6AfZEmAWpS6xyhj8x157FQe2kNg88sLngx
8tGIVK0AElyT4RC33/dq6twXNJkmvCx1GmX4BNk7oiis397ovM5ZybLDyDCPixXn2hfSVTgZ00U4
OfgbJRfosJ2dx3Z7QEkrPolhZ3oLR8X1iRAboRzwiQOIxYYMKhNlRZjQvS63sGSotqvQQ5DtyczG
kSURVoWUxjFqGBTET8sUnn9sKEtSf9cU4UVOsTZrzrnvZViiAkG3bTSGwHdNyMn+wB5PtEDN+JWB
9sRDFhdJR9pU0pH1kdNDvKUF4u+1M2eICDp1XZs8TmPshGvlGIlP0GyvY+qje9QLwy0NkiRAdW8B
pWTPNBEcGSntepCAX7pSzTDHU8CAdEpFF3ML9ALS8DZJI/36GoTis6uYsZ+c6t0epJiqt7isq7ko
S4SvcHIJcFzMX66dYPUmrtxaL5szPeqgYGHQe09+VTTyATD06wU1ieJyxe5XC4ORfdl05mdb5WgM
jhIur4kUjXxz1ZUKZMNbYmMTT2u8xePwzjkUNEelOBjPOm4u///+68vv8nUIZ7T72grWXpf6Tr9O
ZUGi74wsNF+bxUSYLttRQHLmo58mdgRRicngIHVbTQUaWHfjObWFblQLQEZ28vRtQkldXAoMKeT+
OkaDZp+gmy5bG83m3dy4QMEkOcAVgBV3hOxbcYd2uuG46SmbQuyeBI7HCvj3cnPFd9wlXRkiWFbl
IGgWVVKxSXYGjYMOSW3R96EEdMzHSnh1yq0WowkKEkxmc89EpBF7P9a3FQXt1HCzjhgh5bgOJ591
LMCCKKg8TetSyAy3PYfRqGMCYSDOWr0Eue/paNZE857FqAuRAKWXS0G7Eh6zC+ixorjHkgDlcY1n
1boiY7v5KxqbQ0Q71QBpqbMIH9NzNjjyrMQ4NY0xahYg1DQMkIzTDL3WvqK+NRolGVVbNzS1Phpj
3MZawCwxRF4sbjOlayOCxQvPbkdqQzVeYFrYcdpCM4My2QzuxxxEZpizjI6PkRfgnlMSLqIxcgTy
kPhjijpVSEwdfMCisqpAViLWhElshj+QAI2g1rsSndHzBMPjU8o7Mpi88sMUeWpdcpaGcVUZfXZD
YIaTpKCBMC25uWIppzSTBg8s51RaavaIxft50eB6FhMvmiCFV4NnUqA/qUxf0h2OYxsDumm1wuC4
bZFaetWh5Cg2VhPM7W2lp7G7g85ucbvCZXqMAp1qxU5UGJ8uUdNlPn9G+uGC5BdjeuZA7IV2v9K+
vbXETwJUI2ppEO2MvrEIojRzLRjKHdCafqY0cmsabVeczvkRvTMilSTTzVMjYpUpNRMft5Fl2WlE
PFxxWWCHd7aCdyZyCRpDidNCz7NowO1xo9lqxOoNadGwwksJsP1aOfvJsCLCE9ZUYhYEnh/Db0yE
jUKNISYR3JyQIq1e2zNxkN5yvdX72LFRKklXGP1PvwjrMizW1KvjpZ2dH9ekV6LzwYCNo26mivfZ
rh3B6c7GIIIKXPJWBna4gMtIG48IkSEjYu5ycZXnmMYTLumsRO3KOutMCZa4MKVS6EIMQWFn7aae
l1Ggd2cNUSYVChm2GkTg3SANk5YQOuo2psXe2hXa6sUAMp3ADfDNtC3TTutZ1nExxGJ8zgFMBN01
Ayw+jNllYPuf1/k5CiLdqjKwNEXb1PSz3RBl0OxmqliuUYAm3bA2CzxUIg7FfkJyDOOrVKyv8xrC
VZyE4NJKDH0YWGNJE9+RMFQtIIJXqqV3QChFu2mr1lgXFCcxBtnuXxCLUtdnhqEEsDQOM7wuJYia
J5DHsIYM0PE2j8GV4a8lmKVIMXdokwmemBlo6lAMTDb/jZzmPQGotEE8SV2CcDBFj/10np7wRvPR
xPtIPX2Apd2naYSdPEMW15JE+/dJhtrcGg83TIlj/AkMfTwBskSOKVrZvG80kH3VBWMqcr767RdE
s4BtrE4nzzEP9/XlWbxxtJ/4lU+1sSsFAaa4DmpwoRaSxnOjeBZDzvpDNQxPfWMESxZX8XfTtGxo
DeLKIkofQxA7Q0fo1XdUA/Pp/1H2ZEtu6zr+ip+mkpo5FUlee6bOgyzJttLaItJuOy8un24ncR2n
net26t7M1w9AauECOnOfug1AXECQBEksVejd31yQhtHqBhvns+mEXA+Vw7iNy5ZwPvDIBdFSeRUU
lOhNyL0KULNgRO4cAjUt6P7DqXDsw4S5ywD7FK7jguGE7Io8YAekdFOndgPrD3+3ULZH9N+2vjmC
0zh5jKaKdzqWKYq6GW2nRznjyuok9L5oHulq8/4IADKfUn9dm9Zk0EQM/hCVMRwW+q/Tel8kHUKD
19HYAZ8o8K5WwHzcdCUR9QMBK4sdWSYLi13pKBVzx1f3y83h7PM4j8mit3lFwlNpW0zVWEd5fqdC
wUiMOaf5SdQYQiyFkctLTl+xpaifbsermJplTYuMlohGGkEaVTx03JH/An2G4jrkQ53PvE7C/LMu
L1jPsqyrbL10FpYu12ERGl9xDvRk5GXR9KXBbzyNP1kdRDNvenpH+6wsK3QYomuQ/vCpIUlt8hQT
hCljCpZjQlLji7Q2xnE7L7f7eENdYGOv9cwReYIRlSKYROhHRQe0kzQN3v64QewXacZJiWvJ5nG9
EQG3WJIlIrNHE2ng5XRo7yhuv36oOdSa5oW5SPfXtUDDylwoe75xEcTpMuXIQidFHaK3qgPJ4tqF
6jIKOvDCuUtlXOdVb3VZYcXz5aqmtuvYvUnjBJeZDSlwDatKYVGekQMRb+b9VZLWFK3KJoH519Pt
cB7wzeDyA2+RlFHBckC734dxWHFckP1J3w5ENqlt93lalDWZeBeJRKQ3lohgKzBZGNtnegBNpFpn
CeUC2LSeaKUqU9ZLuuARBofuB0XQPx3/ej58V2JSCmj4ejhfvmLhuLKQyA8vfQsIotiFVXuommQ0
gC7ijwlO55h8IY9sVGg8Iyqf4J+cTo5qUtGvVQqVN3XE5mxp1jnfu4J2tDTR1pWstaXIHwLSh61v
Cczpjc2FTTX1dENMFUM+37YEy2pWsUe7yKLcwEzGfwOqXLGNUHti11TOA89b2wVj1pjQJ0Zy8eB5
ZB8k5t4u3VJWEd+A2k69anTtegqkcZs9PGmR1Mvdnt/v1ga1f6L5nyeeas7aMSqJVkXKwo6V5gCR
bcEu+9RDuEqgRjfs4MWOqSm4O/h6MvEdzfamJDsSOBtQ+nNLkET+ZEZ9ucxmZD6SFp/lSTCmGpNv
M9/32cLG1DwLZtstIU7wF05rNvxz7A89Q8yE0O7n63iZcAoTJ9p7CcuZrKKmon/gZ/MgChrjoMpe
0Uxst7xpHAuZ8dqkLM3/hUvou4O25r6nVlx2+XITgexejl9Or8eXwfXwcroYlMamiTEtfqf+RGWO
2mypZ0d+vnz/jg8sYqOxN0q5Y/ONGSOvyRGIeXBzDM/o5tYdPhpbBI4RS8Oi3OexujL2cDWqwGaU
9dqLNGlTzlWy3X2wJm2YzM8oyzxQmYjS5dacRx/QqG8AZbWRFNW48dhc1MZA1gzJRGWqL0xrEzSY
byzRaVMID951eYXfD0KrSiwAMxLH5obSALuswqb+pgZCkqDD6/PpfD5cf7l0D74u+sDD0c+32+X7
6X+PKNy3n68ueoxcWakWlSqOx6E/C7R3Tx07Cx7uIafbe+VOfSf2YTabOpBJOJ5OXF8KpOPLHLbK
raNBiJs4eiJwQycumEycOH/oaCjm/fUd9W2jwNNeeTXcWLsU03EjJw7WfPhwzO5hp/YRQ2Kj0YjN
PBcHwm3gazYd1jj7js4sIs/zHQwSuOAOztGcpkbHl/lsVjPYij1HV/k6fPA8R5NYGvhjh2yl/MEf
OmSrnskguMbG0LEeNtCaisiqyUvuxz50e+TomMDPvTYPTBu1nFgD1MXh7SgWysX18nqDT7p9Trzw
v90Ory+H68vg3dvhdjyfT7fj+8EXhVRZzBife7MH5a2sAU4sJY7xjffg/YsAmqoKACe+T5BOtJDQ
4rwI8qvObAGbzWI2lJ4UVKeeRRjR/xzAcn09vt2uJ9zzHd2L662hu7cLWBTEsdHAVJ8Ooi3FbDaa
BhSwax6A/mD/H15H22Dkm8wSQPUaWdTAh76l937OYEyG1MNZjzUHcrzyRwExkIH6ctoOuUcNeWAL
hxhdSjg8i9Uzbza0+e956ltqSxpMDOHYJMzfPpjfN7M29q3mSpTksl0rlL816UNbzOXnE5P5Ekxd
xveDaPIE5MmUbc5ghzDoQNitrmAYydC3mQTNnfqq4PHBO+c80DrAKtiYXccVgdxajAimBHcAGBBS
NjSAMPOM+ZVNRlowoL5LI6PqYsttYYQ5MTbqQJkfjo2hbi9D5jQ4ssBTBJPQyoI+2EIne2Ad9MQJ
lXqqRSQcDam5NpxMTXbHAexBNQEd+YkBFmfAoUcBzQHDlc5YAOR5EK/fSmPc5A3IfpGochc167Bz
scPJOwusuyfJLtLiRUEPbd4Ewlhb3rFhAsV3xeV6+zYIvx+vp+fD64fHy/V4eB3wfjJ8iMRGAaq6
s5EgaJijzWxkWY99wxTIwvvku6I4jkX50Dq+Z8uYD4feloSOSaj6GCrBMGqm1ODU030khfCtZ+Mg
2BunH/M7YjOeCMdRGcOVxfeXF7W4h8C35sqMXtUCj2lV6Fvnf/xb9fIInWCsnVJs0CPdeUa7eFXK
Hlxez78aFetDlWV6BQCg9hi88fSmtnD3SN2uQN5BJFEbCL69dBh8uVyl/mCpLcOH7e6jIQDFfBWY
soKwBwtWmeMhYMYygPZhI1P4BND8WgKNWYlHyKEpomy2zCxxBqC5EYZ8DnqeuVrB9J9MxobimG7h
HDs2DuHiPBBYEiau/YxGrcp6zYbGZApZVPLAuGJZJVlSdMtcJG9xUhC865fD83HwLinGXhD47+8m
V2lXaM9SnKqAUPEtTV7UzS+X8xuGwQdBOZ4vPwavx386ddx1nu/k8mxcRdj3DqLw5fXw49vpmcgT
sFmGmEaob3cDEO86y2ptvOno8Tzl2gww9UataY8Klpcw18P34+Cvn1++AA9j8wFkASzMYwwQ0zdl
gXfuPF3sVJDyf3NptoezVax9FatOHPAbUz3h9kQ8HWK9C7zhybJavkXqiKisdlBHaCHSPFwm8yzV
P2E7RpeFCLIsRKhldbzGVpV1ki6LfVLA6ZEKatnWWKppDZABySKp6wQNw/XKYHS1ePXInDB6zDDx
sQYFnSBpciPpRfM0E03ladFlotCG9lubQcSaJ8i5tK71JF8ArHJqY0Xq3TypAyOftQrHkSb37AXO
9zQDrtEJucQAMk5d8y7Eg0zRpptRP2FwcB/S0SNRVkVWIuOTJlWR4bRJULjDm/Y03VC56Op0Q9mn
Y2+nI08f4Db0sPq9BO7zFLOJpWs6jr5Ct2M8/bSmHpd6oiVRremHoRQZbhI6szZ2L4wTMrgrDjff
+epNXAdyCDggjRYAZB85WYvYpWPkEUfXwobGz2Zt0qQq3MD0d8zuVJ99mLl3aM0HASUfx1B2khKW
l1RfER93tb4yDOOFKQwI2odRROb/a/Ga8w0AN2UZl6Wvw/hsEuiM4HUaJ4UxIvWj9rvKh+a8h00F
dggHq0wnQwFj0XrhGLV1nBnk6TyHMeajseNpezHvgk+68I2ni2NGJJgDu8wTU/ZBS6ajm4jB1e/8
EcTw6Da1Ojs14843ezG59YqVe354/vt8+vrtBmp4FsVmslflRgGw+ygLGWusxojGdlNAI1Rb2VM8
8jgYU4flnsSwxO0RjY383Y8/RWW+f8oSRTHokZ0zGVF4Ew/hbuFAM5upBzMDpZ8TeuSdmLxKty0j
aqV004moRwn3DjXeoIF6oJuUVbPxmPYi0oimM8pBWGk1ptasQ7qS1nj4N9XcsX9VWGA4S/UY0+VG
af8GRnSaVXcLnscT35uSXK+jbVQUdNmNa97vOJjQiSp/M/8UpZzxkCurQFYuS/0XRlfEtJiwwJAI
KEO9XlQwUbbmQaC9RlgHhvYzVq4LPW5PofVMZjpLY/uksVKVdPjRh/fmdVIs+UrDShvL5vfa+rZP
XSQP2j+Oz3iyx4ottRPpwxFanehlhFGtZv/qQPuFlsdLwCtYgskhFtg1KPXUki96mWSPaaFXE63Q
j8CEpfDLBMogrSZwvQxrs4l5GIVZRvkhiG/EA5RRjjQ+0IHA+GVZ1ClTD8odTLJGIU9yZsOyJNKS
VSPs82OyM4cwn6e1Oa6L2vhymZV1WupnBoRvQNXNYjJBX4qxNnbCR0Mv63GXmMU8hRkv6dkra0me
WEmHpxet29UhGoLo9aRoMWGAuFX1x3BO5qVBHH9Ki1VoFPuYFJiWjZvVZZEZlRqBSWxWCDp9uaGi
LQhkuUybOaJ/1MDxR0UzqiMhs5sjtl7n8yypwjgwJhcilw8jz/hUwz+tkiRjdOFS8kG7zUFEDJbn
MLS1yas83C1AObG6KczMl+ThQnyGOedYueBGaSWmazclO19nPG3FT6ul4HSqScSVNU8oE3HEwe6K
0b9gKmiDqoBdDBRfJzzMdmS6L4GGhQf2Hr0PDVC7cFHh6nFHr6whAPmjXcpUoog0uxcUWYgGzDDz
jAUKEDvcC1Pdy0ABuyWlqlPQHc0WwwprcN5A52xd0Edzgcf43LCRusaO8STMrTo5yjRsYYmbSVBr
lZGxNIXA5qmxUKI3WsjUVb4DEVsay8Oafyx3d6rg6abU64ClkiWJISp8BYuS1UO+wizrMreQo/w1
7vL7ig2tRTlNTcNWBbtNi9xo1+ekLrEjPbSFWLvT510Mu7wuPIIfIgDffrWmXEfELp9VTFWRKJ2j
y1Kla0BdRWjyiCj3vLCVqba4+QWg1fVyuzxfzraWg0U/zpWhEeajzaqo5ci6U5hJpnkCiPTAlGYn
0qjjCqYJWQ+FQ3MZp3SqL7NQs0zTTYGiFTbUqyjdz+GHvCs1ElF2FHhxmSUNkY5PfluCdXksjIKF
PagOg7UPbzg0w1ZhEp9VqZ20WCusKFwhkYRtco0bccj2q0gfab3+KkrNqsOiAM09SvZF8tT6fVmi
lp/eno/n8+H1ePn5JoTAsmSVRrsy2TfeDaeMm1UtoIa0SDmGyHIucKIcp3eIRlZyKvpIg4E1vYzX
Ec+IhiA6Tlk4xxHfwjpUhJljgjejxsSwiZQhbG6PtfBZWsOCX6CTHuw4fwZ6jUbqqX7+Xt5ug6h/
QortVB9i+CfTrefh4DqauEUZNcdeQuWYE1AYhiJhahiqHkvkTu+mgtEKnbPbdeB7q+ouEaYQ8ifb
O91ZwAhBOXaPSrKfLZSS7w7HHA4legH38sQKSpGdVXzgaPuabOLaHwY2lGUz378DBlaZS41ARcag
1TN8LH2YNkXp28pv+o54YTmNLzukkMqLwUF0Pry90fsL6E+F5neIwKfYkh+uuw/JJDewof/3QPSN
lzVeeL8cf+DT5uDyOmARSwd//bwN5tkjrk57Fg++H361No6H89tl8Ndx8Ho8vhxf/meAmcLVklbH
8w/xsP4d3ddOr18u7ZfYr/T74evp9avtdCVmbBwZ/lJiIsYFu+MJID4UTI1VW/oeLMPbyoSb58MN
mvZ9sDz/PA6yw6/jtTPdFFzPQ2j2y1HzRhDMxiTBBXmil1470VCvGiF3qpZrzoDRWon8OKwoXbDD
w1Zu3kY3uMCGaE1ZHl6+Hm8f4p+H8x+wBh5FlwfX4z9+nq5HudVIknZzx5dwGPGjyCD/Yuw/WLq1
3gmo5U/SYTYYzpHRlzgdEa/hWAP7EWOwg8Nx7w43gjbBOyjxoN0YYiDSp6k3xArQXgg6BAZArsus
M0hAvghukNNxzdhU2Ft1tPoGTn6U5OnEGC0AqVmexE4Xr7l6OSZmW7JhyfJPQ9NZlly/fBBgs4et
o0u0m0aToYkTka0NlsTGiV7sFzxO97DvGuqWuJ2DjR7PgD1GQPf5IhXJ2GViL6NDKWzm880yNBpv
tB09riPQmOa1GSNNNLR8CmsQAeqQI73dmKFFJCuWcLkWL9ItX+sh3aQ84Ml68eQocgefbM1vks+C
Q1v6kl2sSmvhBxaM/a1LBVoxUMfgn+HYG5oVtLjRhEwLKDgHp+A9DILw7jC7DSNQMnkL2Mlr9e3X
2+kZDlFiXXRsOitlUIvGb2wbJelGL1/40W/m+k0hD1ebEtGOFuPM05ziPn4eTadeU6l2HnK0VWfS
MkRPOqIyvqt0VzoB2POoomJoS+QqHjI21DIpNV+JOB+zrV0eQ68933hi6tjNf/04/hFJ6/of5+O/
jtcP8VH5NWD/PN2ev9knPFk4umlX6RDlwxsPA5NB/27pZrPC8+14fT3cjoMcNwdLGGQj4gpO4hyV
GJMrjZFEj6Va56hE07JgAd6zp5RrEaFVM+LqqWbJJ1g39bjBDVhukeQ0hA/EzLBPXsIZTvrDuQ8L
SimG0x+CWLxS98QOtMcE1xGc9zDBAIWvzM/qNCpXe6N3Cn3GF7TqLPqXLnLU3wgnGVGCLDwyWhLN
p3qUPgRuRNSFPCcDnuNH4SZd542ybn4cU8snInCKq8Ywoqb1fOgZsDVbRSYkXqUTkA+rpfgAxJNH
ZKWj1pZCO6yLTnyyhm3FPukAOHau0nloHnwQlXPq4jFPcsbT6FGjbmC2qVHjuAja8y92Oz3/TaWi
7L5eFyxcJJjLeZ3bBwm1lN8LclumkJmcka39KO7ei/1w5ggv3BLWY0dw/Z7i/iiZZNpQ4b0J3hD0
EHFfICwdtBeNDroXDw3Ui0hPIp4KojLT9QpBMK9RCShQa1o94e5ZLBP7dhAflq2VUnyvBIfXCw6L
oReMH6inJ4nHbERDo5/zKJ8MVfuqHqrHnhNwERGZsqHosQH10YRMLNhhH9QwkwIqw+MZQAxVR1XQ
wN2h1gXVfawIB07pPx1WdVlpgGNvaw8DgMci4GFu3BqZZKbthYWfkTEl+y6P7cobuOuusaPRIoYK
aBN0Gd9a1uZk6OJ/GZU9UTqOQJGhh6VoxQGdn0z2mg/HD+a496lM9KKa2JFuHvIoxOhtrsp4Fo0f
NMcuWawVB7STbtWgXdIqeQZUeMqG/iIb+g9m4Q0iELUaM11cdfx1Pr3+/c6XsQ/q5XzQmJj8fH1B
Vct+nBi86x9r3muWXYLdqLs7h8kMmy/7lG1r9TwogBjF2RoAGRufEHWNqA/LJ42Kz4e3b4MDaHD8
cgW1UV/pOpbw6+nrV3v1a+5xTQltr3d5qsWX1nAlrLmrkjuwOY8dmFUS1nyehNzuf0Nx335XI40q
Ki2vRhJGPN2kfOdojp49XUO1F/hiSAUnTz9ueNHyNrhJdvaSVBxvX06oNKMLxJfT18E75PrtcP16
vL2nmS5jlKXSvtPRPRHJ6/dsqELa9sIgQkMiUzw7NjXB/juJmePMoScA2SCpO6fzNANmE21J4hCD
5pX4lMGieq0oDQJlPRshVOWMoMqSZRjtcKYt6KcQQeW2Ehfo5tq6olimEmSq1a6GyB0I7YxQc2iv
cCPoqkeQUGmImmNMxNRGGrRgRAyYHrehdVW8NLVcSAC4T4ql5kKCsC74PKhQRZLpjZCPlu1IY+C6
EBTRJWB0Mjw0qJG+4yeRvBtQujk3y4BtOaVbYYzAPI72WtEyyVAKsImSbL7KtjrZFmSv2O4/74pP
GAey0pDC1HWFZezzpZ6uqEdRw/Ikmm8lFWjgd77QhAGAic4uCUAqNfnbYt80uxvB6Hw6vt60U0bI
dgUcd0T3aUnSL5b6Md/XoTASbEufrxfK62VvrojlL9KMMi5Yy8+00uH3Pi83ieWJ1OAo4UU4S7IF
NtUxH5AE9ouKEZ8KOC4EPDFO2W2wO713nfSut9YlKF576rY98QgF2Xq2buBqc1BgQxalKV7nUkYR
3J88qnbKQBYos6sKaxEPEtbwJFPBBebVksg/PQNclzg4f46VWxWBkOcf0KMYM5wlOsKmr7CSw6Sm
TIBUAu26QEG4zmxtJ/rbPlJxxrWGCqNUc902WUJQLaS2+Y14CECkUoaAoRUaay0U5JbRynx+er5e
3i5fboPVrx/H6x+bwdefx7ebZobS+gr+hrStc1knu7mq5TeAfcL0bLM8hClI70uYQ1GJAWVbHrRF
N44VarktbF+lZEanFdpeR5niNgI/8PkwK8vHteLL3xKCfCUgecqy1ITz0gvpYISngIK8E0Jfp3oY
qSmuFRxLx8OR70SN/4+yq3tOHUf27/NXUPO0t2pmF8xH4GEehG3Ag40d2xCSFyqHMAk1CeQCqd2z
f/3tlmyjllqcc19C3L+2rG91S61uJ9TpuZCeE9HvDWiIH/jhXXvgKCOi/F0LnUneywWZ1ZFI5XKc
H7VXNlxQ4XcacjqCxteE1eISMZRNjmXl/6A8VsAfDVOxbirjIC71MYxTxgwkOrzuDvttqzj6zMkc
jJ4QJN2NP11aU7OOmXuXJub1x26QXksx0SG3iaAzran/FQqpi91W4qW/xErhTb+4GjEknpWvTYGz
hyKLFnEqtzXVov5+3P4NCXyduHipUskjAp6iwCIzDsmcUaD7caNJmyLgO2yXqjlgqeYD09YMJNqt
3M70Z1EGs1o56Ckpur4hzpWneVFE8Zhe2Wzm1WTGrSO1PKveosnUJ3TX0kC3W3JGD7Km893H8bL7
PB233OawckQK9eqzLc28rBL9/Di/2u2WZyCBE+UCCZsFt2woSMq5U9TgNCXFQJBgJ6oWYj7XJHeN
HIsXYB6ivDmjh9Y6vEjvgoHhgRJq4x/F9/Nl99FKDy3/bf/5P60zbsz8Bb0+oFsZ4uP9+KoGA6ng
+jY9A6sLfKfj88v2+OF6kcWVQc46+9fktNudt8/vu9b98RTduxL5EavaQvhnsnYlYGESDKVxRyve
X3YKHX/t33HPoakkpquBEh6uoRV8h4vr5ps/n7pM/v7r+R29eLqKwOKaCJTiTGENm/X+fX/4jytN
Dm3Mi3+q9zTiqRStJnl436hA6rE1PQLj4Uj8VSgIxKtVdVgJ8nAQJoLe7NLZsjDHeQYNITiFRudE
a5AC5C1NVdLgJsobD2eiKKJVaBbCOjm6lncTrshF4nBd+td9rfA/l+3xUJu2MWaXih3Ds27+NFz0
mzyTQoAgx62SFQPdcauIdpCpK9Dt0uhnV0RGXbqVmTrW7i2eG3F9ao5y0e84ws1XLHk5HN11OWW8
YiiSfp+6j66A2ijD/SpwwKhBewK6a5/AcpJzW22RXsHwsAE9eEICITS0jT9myXT7hdDNzSMNxRM4
Kyoh4vNJNJFclFxtPoKkyOVQ/Tsp2HcsVvnVAodgw+LpLMXD9aY1JbMpXrNWjxy1AG23u/fd6fix
uxhDRATruNvrOwKPS1T3l1gRTBcP40R02MEDAAkNo56pY4Fx4kM3Vc4IeCrlD4RHNutEl3i+SkQe
UI1HkUbsQJCYw5H9fF0E/Fvztf/nvMM7hEv8rtc1bAjEXa9v1THB+dBxgAxJXCYgjPr9jh2pVtH5
JAChYbulg1pHBNq1P/D6nApVlPNhV/fnioSxqI4Ea1GGdrRftAAL6P2o8tcFszZM1dQ/swju2qNO
3tf72p036pDnQXtgPm+iCYYVBcVfgLQQE3ikn7yJIJJKqKA+OlSkTWcIb4SHQxOulQv0+9fubEhc
aQxbCR13mhFquFiFcZphmIsy9I0z0dn6zqFARwvhra3cGRoI+ZA6UjZope/1dCfPkjAky5MkOaLJ
4TLXHbCdXaxHA+I62M+6Pd0zWRIuNk+dJkfXNDNv4I2c9b4QSzP6YC0dyIXPrN8qChstdxHItT9J
g+YcutEVEWkPO75BK2BU9ylNhQ83sl9Hm074ppExp7vXXnDdG5wMOm1nqSvFeG3h9fC6NZT0wSb9
j4GUrDsXw/UhDwtfxMR+zn6j0lk+30EapZftE79Xha9sVJeGS60qb7sPaUdZ7A5nIpeKMoZWy2bV
XTwyBCUUPqUVxq4j4WBI1hF8Npch3y+GbMjXSNzTiGSgHt61dU/ahR9YUcUVjaw9itQEcLpqCHh7
O8f7qcU0Y41jiqygq8LqyYgbft0oMCtR+V3Yv1SEFrRk5c5OVzh4Br310eu+rOGiKpVSZYusfs9O
1AaJGFIaCfJYVa2/EJ+Nx5YK9EBXA00w6bcHnC0ORmGmZxlA6fW4jVoA+iMPj+Z1Y3NJ7eZGCoPR
wCEEBVlabtSpbk0pej1P24pNBl5Xd8oKs2K/c0efhx7xXwTzJG7ocVNHhB/r92nQXjVvBIKfF25W
qtqhhB7x8vXxUfsOpNOC8jkYrmA9MRpRaZASdyNK2CxuMDSC8nWD0MxQ5Wxu979fu8P2e6v4fri8
7c77/6J1SxAUlTNPbWdwujvsTs+X4+lfwR6df377wiMzvfPe5FO3aN6ez7vfY2DbvbTi4/Gz9Q/4
DjoorfNx1vKhp/3/ffPqrulmCckYef1+Op63x88dtLYxnY6TKfEeq54t12trUXjogdcheGbLbrvf
dvT7ahBPH/N00wXJyWzfCsLLvCZcTkHpI4Khu0hqcts9v1/etFWjpp4urVwZdB/2F7qgTMJer3Kz
fx1n3XbH4d+rAnknWuyXNFDPnMra18f+ZX/5breMSLyuLkIEs1IXkGYBCo3UT0Hge0YwrRopC093
3qqe6Vw7K5c6SxHdGXGlkOK1+WKbpahOM2DmQAOzj93z+eu0+9iBZPAFtUL6X2T0v+ja/5relxZD
4nO8plC+ebIekMkuWqw2kZ/0vEHb2TmBBbrvQHZfsnGgA8yaFBfJICjWLnozgppzDGddKJsj6d/p
2gm0JeXPYFN0HXK9CJbrjtUqNYiRKLjuAACMK22LQ2RBMTJcBkraaOBIurjreqyINJ517nRzR3zW
JS4/gRd1f+9IoHa4QOHDWQMw0B0T4/NAP/+cZp7I2nSjSdGguO02d97fyB1F7I3aHWKmTDGPc24m
oQ6Nxf5nITpeh40vnOXtvkcUqLyv3yyKV9BiPb8wZqMeBoLh1SaENI/Ci1R0unTcplkJTcu1VQb5
9NpdEiCliDod3V4Dn2mMPNDXu13HVgcMgOUqKniBxC+6Pf1MWhL0XaG6vkuo1L5+A1AShgbhTn8V
CL2+HpxnWfQ7Q4/sVa/8ReyoSAXpkeFWYSJVL5OiH5CvYlAVtecnqGqo0I4+8OnAVkYYz6+H3UXt
bTDz/nw4utNqST7r2xnz9mhEnNupHa5ETBcs0VzMgQbTiWNxS/xu3+uxp7xqfpMp8st4/bEGtgYS
KH79Ya/rmItrrjzpkjgIlE5n40eRiJmAn6LfJYICW8m/NHFj1G0zQ6tNlmuShM5YrWjb9/3Bajlt
lmdwyVBbILd+b6mQNe/HA7nOjd+f5ersudp9dTSCvF6fL7NS27olyZRoPYzxhH+QkDQjJYlUxeAz
W61TBxBxpMX18+H16x3+/zye9ygJcxXyM+xEVP08XmBl3LM7zH3vjg2uUHSG9CYq6kk9NhADqkvG
JI8kmDm4CSuL23XQS0P8NLLJFgGqTpd04iQbddq8NEtfURrFaXdGQYGZIMZZe9BOyOH3OMk8duM8
iGcwaemhOzIMoqSJfZm+fRH5GcYxo9vOWdzpuHb2AYTJhKwPSdEfOMQVhLrcFYpqBjF8DepUOuzL
fk/P9izz2gMNfsoEyBQDi2BKZVYlX2WxA3qDYHu0CVbNdfzP/gNFYOzrLzIu1XbXYgQ6KTH023wF
xVEgcnl8vVk57qmNO16XhzLDvK4WOibB3V2PCkVFPmEvaBfrEekd8NynvQHf5AQhXEG7JIjRKu53
47YlCf+gpipDkvPxHS+xuDb7NauRm5xq7t19fKLmzo6mJF6P2gNdLFEUfR+mTECoHBjP2r5MCTMp
dSstKR7vzpXLTiO+lfptwnIMIyaihCgoKUFdQi7pxXEEsDtkKdslEC7TNKYp4fm99XXjkr58E29u
0NsKqyTcKCNQWePw2Bqf9i+v7HE6Mvti1PHXPb4jI0MJgmeP7WgATsQ8JN86Ygg49lMR8oMGQiTS
5kXrzL8eSg+aqwl4UGulXsNItO4daJgokzDezGI/8O3UFFjqp88yvQff/ATeFZiUvLUi4lHCW9Qi
puwAHfmTdxS75ufkdb4hJ70jWj7ENMNAqHyIKvEov29t3/afjPe3/B6t2TQpFoql+0PB2xy5QD6q
wF8tBDFxt0Uweosk+raZFS3RDP23jFmPhrDShKVmNKRnRmHj3E8KGATqBISte8Wobm1MuQvmiqGM
rlfm1Boye2wVX9/O0p7nWneVG2Pq42LsJ5t5upDx6b3GE0XdNLPHOh4vDPM8Dxf8ZTKdL8CvM82u
sRQRyJ3argHBRKz7gUQIu26UrIfJfXVJmnw3idZQPUmURbc+XXcAJoFsLTbecJFInyPO4jVcSyPu
Oq0E6PeZwwOIzKzIslm6CDdJkAwGdEFEPPXDOMVzijxg7daRp3IRKjNC1kPS6lq6aCMF2WKlWFIb
8Oi6rQ5InOnHm4aLN7Ltic9qTgO14CGPHFHjJdt8ic77TDcVJKFE1GtHdaL4cjruNS9NYhHkaUQ0
9Iq0GUeLAMM5Zq7jS5VUI9MKbR9uAfN6Yjza03flkX2jgm1zS6R8L1dpqa3ah9bl9LyVop85vxUl
MRuFRzQgLlM8MopYXbfhwNg82kqKgHFMgqQiXeYwzIBSpLprLQ1jr5Zq+AQdV3GWeWqmKmd05lU0
R8dqYOKSvaEWLBX6P0PNyoj9MHOLsd5tthtCO6rIpmx0G12OgofaxeVmQZzEIKLc0VqRAjSIdw+p
MQjp75cmWxB/55IyDtEwjBJTX18V0fNDFofraxhw3VeOHTZ8iQYG07uRJ/RE1obVIVIaS3Z7s8My
Z86STZqRextFlHKeoos4SshdICQo82q/zGPa+jn8vyAhsPx0SV0HguSzuV+KIAj1Smls40GAggUo
M71jJYah/VXdptKeOincv4MYLidfrSJXAjUx0MJgJsxEXpBMASktIgx7o5UoXKNETCeZmrYZ430E
qEPezhIvs22Qg9ffJniXy88fM9OdNQArkAzY+8aTwrqLaBIiRbBu40+EAti83i/Tkhtf6PV0UvQ2
ur2iohHSZInxATSCT/y3VTfedIYUihiLRwcNXbJHGEdtE+gREDgGET8IGQYtjtMHlhUXnTWLLLAN
1lTl0eA1VKUsrV6NGp6EpcC4bpYK4j9v33ZEYZmAVOnPQrb7VtxKVjzvvl6Orb+g914771V2gAGy
YR0TSgQGTxzk+hn9PMwXeg3X62X1CAqv9cgNAgWsRVnmJjHCiXZA5I3ZchqW8ZjNJ6y7k2Dj5yEJ
aKJ+6j51FaHsytBmg6hQl3nVZVnuYwv9vjc81L4P/vh1fz4Oh/3R751fddiHomRiGm563Tv6YoPc
uRF9M58gQ/3czEA8J0L23gyMN8OjTKzBqMHScX194MyXfnxjID0n4qyZwcCJjJzlH9Go6A6m/g/L
P+q6Sjnqub8+vOM22JAlKlLsVJuh892O9+NcAU/HTEDexP7BV422rMmemVYNcAexOt7j0+vz5IHr
M9yusI5bFd2U50cZ7Dhy2LFGzjyNhhvutKQBlzQp9HMA6oPua7Qmg0ZY6hscVzqIOEs9sF6D5Kko
IzatxzyKYy61qQh5eh6Gc7N4CEQ+ukblbuo3HIulHq+UFFPlzkoUBLC5K9wd8izLCe+cCpRI3/A0
fTVw0gUzZWC4236dcOPYcjg/Dx+1GRyfYN2/X6L3VLmcahsTyh09NAKy5SBxaS+OraRKjE8RBjX1
KtkpgaxCeNv+8HETzDBMqIr+4+aS4lbk3+AqQn+Jgh4o1WEh94/KPHKEoax5b4LsmisvwM9EHoQL
KBiKhSi0gOAEsqnpfsti42RQkJdQwFT6J9VKobC+fBfdcKoQstzpVeWD6Fp+3XwyLpI/fn1/Pryg
ed5v+Ofl+O/Db9+fP57h6fnlc3/47fz81w4S3L/8tj9cdq/YfX779vnXr6pHzXenw+5dRqPdyTOd
a8/65eqosLU/7NF2Z//f58oysBZHfBlnASU/0BhyFdDAcjTEcmHoEV0UBxJUCigJi3RBqkqDoCHq
1B1G/oQVP8Gq7hE6dVLNSr08GRwTmEQogxZImq2YGnbXa2MPbI7lprZwXDWumPzT98/LsbVFl+3H
U+tt9/6p25wqZijKVGSafk/Ink0PRcASbdZi7kfZTNf+DMB+ZaYCR9lEmzVfTDkay9jIpFbGnTkR
rszPs8zmnmeZnQJo7gwrrARiyqRb0Z0vNIE2pNMbi2s66XjDZBlbwGIZ80T7S/KHad1lOYM526Lr
G5TZ17f3/fb3v3ffW1vZ7V4xvuF3q7flBYlgWVEDziFMhYW+/eXQD2ZMMqGfBwWnYNf9LvGYt2B2
XIVev98ZWSqm+Lq8oW3B9vmye2mFB1k0NL/49/7y1hLn83G7l1DwfHm2yur7id1MDM2fwTIrvHaW
xo+V/Zk5vKZRoWIvm5kvwvtoxU5oTZ3MBMxJK6tsY2mXjVECznbOx3ad+3qgsppW5lyFsj6ZmvyM
mVfinDvqqcB0wr2SQSZvFXx9KxcgOTzkImOSFej4p3QE5q7LgFeorQqdoTfFuj6tOuH9fdUznOHk
rC7CD4q4MhKtLWl254vdpLnf9biPSOBmRa5nvMemCh/HYh56XBMp5EYzwLfLTjuIJvY4YVcC5whJ
gh5D4/j6V2fWBhTBSJGnanbfz5OAGFrXg28mOizR9Q3AvP7AQb7xUr/DTVwKqF67MevNRNdOlIb+
rqklSC3jlNtIrTgeMpUX1cX3n29kC72Zr+z1CWib0hYzxnH6UDml4gHLWU/ddUQSglonGAAVF9dL
RdnnxgDQWSdT1fIUFsxLE/l7o3NX07pd92GeEY8KTZv0mM+UD6kZDl1V/vHjEy2w6us2ZpYnsWAD
/NUz7lPKfGzoMCppXur9AJ7dmOWeirKxdshB8zh+tBZfH992p/p2EF8U9HS68bOc3d+vi5uPp4Y7
Nx1xzK8Kuzm5SRa/tMU1BCzinxEqGCEaQGSPFopfAv1gYgro7/tvp2dQCE7Hr8v+wCzHcTSuxpRV
44D8cJZFJtUZtajOLhYeakSk2yk0bCwcMNMC0utZHYTD6Cm8ul7gWG593rk6XEt3Q8hCpmZ+Nut5
9sD2e1E8JgnG4PPlXgRGybDHKd5d+UuKkGfpV/q8fz0oA7bt2277N2h4eqdXG+3YqOjJuGh2WvhD
jZ9I+7o/sxD5o4owNql7YOzsenG0CEHfztEpJLXdEq6ztnEEywf6ZdS2jGr7m0VYbpZlpJ8V+GlO
ojph7NgQNJNkTFw7qg0goZvbpVezHhl8QzrBTERmf1bhLGSQZeBHPGDzk2ztz6byTDEPiWTig0gP
I5yQOgPKYcsz8KlyuaFvdT3jsXFnSjufROLID8eP/CYgYeH2zCsGkT8IGiBbAdBm/EsDIlD59OlO
TwgGjhIu+YS0iAZKktTfhe4VpIlWfCaNJxyZMG3G5DQL1i9c5Q2jZ6QGIUfvsXRckphkJJnwNzle
PyHAbrfV7Jvpk26tpwFjADwWUcsxR++x9GotNfq0vttY13AoA63FKZGHdComq/fisR6VRxRF6kcw
BFchDJFc93yL+3IwiHR7IUWyhyPSiVugBX5f+lMWmdzQ1K+G40hETARBvik3g95Y31NHBHIcixwt
emZyub2ixUOUljFRRmRSaCnnMDitszEOFz4ICrnm4a6YxqpOtaqO0zF90odu3e3jp00pSC6i/B4X
qJjJQJJFytf3dUBNdENlubVcN/Eq0CNZ1tRpWOLtl3QSCGL7hCsHnVoaS3xj4jdTlDJHMYuDqGt/
rgJzJxjfAmGGDfSdRR1bNiDdY67XSUn9PO0Pl7+VCfzH7vzKuaGW69xc+pZkT/Il6ovKTrVZkqSF
GMz90xhWsrjZN7xzctwvo7D8o9e0pXKfbKfQcIzTtKy/r0LcXrt2Fa7XCD1FyJbXIRBBxinM/5sw
z4GPPw9y1lijSuzfd79f9h+V4HCWrFtFP3H1qzKD0ix3eJFDRjYPIl/84bV7Q70/ZtBx0KSQxiLK
QxHIzU0A2XVuFqKNM1pCwGzBjiKVoSL0ZYT6JCoSQeKLmYjMnoz/qU+wmMYklRZ/y4V6QcQR3trz
xjzfQyjm0nWYny31EfbTlSprVWpA+23d4YPdt69XGVM1Opwvp68P0417IqbKLypr2F3lj/o+r2hy
QnvY3KpEYMLNZsmXoFnZjXTwyIUzaarjaC/HhViA/LGIShDu8SU9MYm6TtPmPr6KS14U0zt2P1Vb
tExopEP9iys6WrhYMnt1QtOkq91twMGNoa5BKdUX1CpUKaD1emF8p4E24UL29Gpi4M2q8Svpw4I9
15NglkZFuogWU/5LMKC4+9qKIR3/CWOhMDNfkVlJlHLg2Rabb8om72Oy7vkJ20OqL7kUy/2lHPou
HMYdDDvb9pFy0Rr/o2NMGbEYG4tt1WVAtolhdNsVUSPuaUgeJC5xKSBztT9DuUuCGOIcHh0eMVUy
K34yrHqu9OEoDxxdI0jLDFrUTZTxnpEOgTkZXh3BzgWORlv/Vig2Isoai/T/KjuWHcVh2K9w3MOK
f4hKgYrSlrZsZ08IzaDRaDSzSIC0n79+JCROnEp7AiXO2/Grju2vOohvTniWXz79vUrmso1eqrBJ
G+EX7Z/r7ecCg708rkxKt+fvd8n0DQWDBrLeqnmWRT36qR5LkR/BBqNuj5g2wZ9aux5RGzx2z8Bx
mWPBytMWHyqMZtCwYzoA2wHms2o34b7ML5D9N4CFvD0oyV9AlfwnYaVaoiQubFeWHdMM1v7xC5An
nj9u149v/CoEs/h63C9/L/Dncn9dLpdhHqLWJTjckHAZ597pekzmYT1y4+LeTNxBAwQmol5UjrpA
9lahWnEcy5cyoV1B2HJ5R3TwaeIauPvt1JnQ4d6ONA3lPmlGM4z0ASxblZ0GqhS7JEZ1qTfBHUVd
5ZncRA6ED5LQYTsJLe4XlNejh2KdbV8MKx5gMtU483rgfzDGjUsvJ1D/AQ1+k+xpWk70iBqJFaK0
hp4Zx2YA5RHIKNsOZgjkjul/hpx8suzwdr6fFyg0vKLZTMRwpkOpRDIcZrBa4bCJS9gzSdiyiCmB
wm1Gg3I8xiGopG/I7NziBRY9bEQzVqYekkUC51TlF76GYdD/Z1G02ByuICQFMMy9YEKAqHFQA5JJ
0FzWJaeOheVhmMnKRbMhh67ThhCN08Wr2Cv3JN5NoM0s0fe55HANRYWAQQJJg/jsU1eYr4UJdlsd
xul4a7cFogO+QnsSc2AD0XIageBjSLwdBAnCoYgEx8lZbEPuJThm6ruQ1JPsBnFgZQowR/CCssMP
UJ7RvqVOlteBsLgHPO8P+uSS/pw5IO7IAqYcJ94z1LCR26Vdp+fk3w5oh6RxosxBPdvbBEuic5b4
0j5D6xBIGes5EJYdZwC2U23GOQCLRhZVdGdJbn4aGtNhikbNyg90F47ZLjNxuXPlpgH6Z9DJkxuo
TzvdZsahC+cRXtaizV7H7OF3M25933KNFpurJmYREoyw1ZsGNWrnr4owISbDmZrMjHFqtPh4eC34
c+xRx5w9ytEAme2yhDiYWgiq3nP/bIvuzqqsx/C9a7CZeEOjfgaDcSZl2CIqyjLhrw+QcRUGJaUF
JbWj6Wv7FUvscrFf4ScrvPz6w3InIiabFdwwdHd2j3hVDhLNOrRRjpfbHWUilNsLTAlxfr8ETtb4
5Nevgl8A25HiYrm1XFa+8HZqdUT3pbDoZA80Cra9xXJhsOj2OlC4p+2asDHfo2b6I4fXcECPtKaq
UdlWW1U1Gy4S80nUoeozLYYAUgz8KFMt+3K2rDkD1q5ofyXqLii5UGyRtRPzRXhdUgHiRFyJVZ8k
NZ237ZX7FEelc7CObIkHMVvN/wEz2tojKIABAA==
--===============7368936945091470191==--

