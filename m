Content-Type: multipart/mixed; boundary="===============8893908989817440074=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:488:7: warning: variable 'port_enabled' set but not used
Date: Fri, 07 May 2021 15:26:51 +0800
Message-ID: <202105071544.fXsdbU7G-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8893908989817440074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e48661230cc35b3d0f4367eddfc19f86463ab917
commit: 5b552b198c2557295becd471bff53bb520fefee5 media: atomisp: re-enable =
warnings again
date:   11 months ago
config: i386-randconfig-a003-20200826 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5b552b198c2557295becd471bff53bb520fefee5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5b552b198c2557295becd471bff53bb520fefee5
        # save the attached .config to linux build tree
        make W=3D1 W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   cc1: warning: drivers/staging/media/atomisp//pci/hive_isp_css_include/me=
mory_access/: No such file or directory [-Wmissing-include-dirs]
   drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c: In function 'ia=
_css_isys_rx_configure':
>> drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c:488:7: warning: =
variable 'port_enabled' set but not used [-Wunused-but-set-variable]
     488 |  bool port_enabled[N_MIPI_PORT_ID];
         |       ^~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/hive_isp_css_in=
clude/input_formatter.h:34,
                    from drivers/staging/media/atomisp//pci/sh_css_internal=
.h:26,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src=
/rx.c:21:
   At top level:
   drivers/staging/media/atomisp//pci/hive_isp_css_common/host/input_format=
ter_local.h:118:27: warning: 'input_formatter_alignment' defined but not us=
ed [-Wunused-const-variable=3D]
     118 | static const unsigned int input_formatter_alignment[N_INPUT_FORM=
ATTER_ID] =3D {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/input_system_lo=
cal.h:10,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_in=
clude/input_system.h:34,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src=
/rx.c:17:
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:380:19: =
warning: 'MIPI_PORT_ACTIVE' defined but not used [-Wunused-const-variable=
=3D]
     380 | static const bool MIPI_PORT_ACTIVE[N_RX_MODE][N_MIPI_PORT_ID] =
=3D {
         |                   ^~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_input_system_local.h:374:30: =
warning: 'MIPI_PORT_MAXLANES' defined but not used [-Wunused-const-variable=
=3D]
     374 | static const mipi_lane_cfg_t MIPI_PORT_MAXLANES[N_MIPI_PORT_ID] =
=3D {
         |                              ^~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/media/atomisp//pci/system_local.h:=
10,
                    from drivers/staging/media/atomisp//pci/hive_isp_css_in=
clude/input_system.h:33,
                    from drivers/staging/media/atomisp/pci/runtime/isys/src=
/rx.c:17:
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:155:26: warnin=
g: 'INPUT_FORMATTER_BASE' defined but not used [-Wunused-const-variable=3D]
     155 | static const hrt_address INPUT_FORMATTER_BASE[N_INPUT_FORMATTER_=
ID] =3D {
         |                          ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:150:26: warnin=
g: 'TIMED_CTRL_BASE' defined but not used [-Wunused-const-variable=3D]
     150 | static const hrt_address TIMED_CTRL_BASE[N_TIMED_CTRL_ID] =3D {
         |                          ^~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:145:26: warnin=
g: 'GPIO_BASE' defined but not used [-Wunused-const-variable=3D]
     145 | static const hrt_address GPIO_BASE[N_GPIO_ID] =3D {
         |                          ^~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:142:26: warnin=
g: 'GP_TIMER_BASE' defined but not used [-Wunused-const-variable=3D]
     142 | static const hrt_address GP_TIMER_BASE =3D
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:135:26: warnin=
g: 'GP_DEVICE_BASE' defined but not used [-Wunused-const-variable=3D]
     135 | static const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] =3D {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:122:26: warnin=
g: 'FIFO_MONITOR_BASE' defined but not used [-Wunused-const-variable=3D]
     122 | static const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID] =
=3D {
         |                          ^~~~~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:116:26: warnin=
g: 'GDC_BASE' defined but not used [-Wunused-const-variable=3D]
     116 | static const hrt_address GDC_BASE[N_GDC_ID] =3D {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:104:26: warnin=
g: 'IRQ_BASE' defined but not used [-Wunused-const-variable=3D]
     104 | static const hrt_address IRQ_BASE[N_IRQ_ID] =3D {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:99:26: warning=
: 'DMA_BASE' defined but not used [-Wunused-const-variable=3D]
      99 | static const hrt_address DMA_BASE[N_DMA_ID] =3D {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:90:26: warning=
: 'MMU_BASE' defined but not used [-Wunused-const-variable=3D]
      90 | static const hrt_address MMU_BASE[N_MMU_ID] =3D {
         |                          ^~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:80:26: warning=
: 'SP_PMEM_BASE' defined but not used [-Wunused-const-variable=3D]
      80 | static const hrt_address SP_PMEM_BASE[N_SP_ID] =3D {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:76:26: warning=
: 'SP_DMEM_BASE' defined but not used [-Wunused-const-variable=3D]
      76 | static const hrt_address SP_DMEM_BASE[N_SP_ID] =3D {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:72:26: warning=
: 'SP_CTRL_BASE' defined but not used [-Wunused-const-variable=3D]
      72 | static const hrt_address SP_CTRL_BASE[N_SP_ID] =3D {
         |                          ^~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:67:26: warning=
: 'ISP_HMEM_BASE' defined but not used [-Wunused-const-variable=3D]
      67 | static const hrt_address ISP_HMEM_BASE[N_HMEM_ID] =3D {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:61:26: warning=
: 'ISP_VAMEM_BASE' defined but not used [-Wunused-const-variable=3D]
      61 | static const hrt_address ISP_VAMEM_BASE[N_VAMEM_ID] =3D {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:57:26: warning=
: 'ISP_BAMEM_BASE' defined but not used [-Wunused-const-variable=3D]
      57 | static const hrt_address ISP_BAMEM_BASE[N_BAMEM_ID] =3D {
         |                          ^~~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:53:26: warning=
: 'ISP_DMEM_BASE' defined but not used [-Wunused-const-variable=3D]
      53 | static const hrt_address ISP_DMEM_BASE[N_ISP_ID] =3D {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:49:26: warning=
: 'ISP_CTRL_BASE' defined but not used [-Wunused-const-variable=3D]
      49 | static const hrt_address ISP_CTRL_BASE[N_ISP_ID] =3D {
         |                          ^~~~~~~~~~~~~
   drivers/staging/media/atomisp//pci/isp2400_system_local.h:44:26: warning=
: 'DDR_BASE' defined but not used [-Wunused-const-variable=3D]
      44 | static const hrt_address DDR_BASE[N_DDR_ID] =3D {
         |                          ^~~~~~~~


vim +/port_enabled +488 drivers/staging/media/atomisp/pci/runtime/isys/src/=
rx.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  482  =

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  483  #if !defined(USE_INPUT_=
SYSTEM_VERSION_2401)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  484  void ia_css_isys_rx_con=
figure(const rx_cfg_t *config,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  485  			      const enum ia_=
css_input_mode input_mode)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  486  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  487  #if defined(HAS_RX_VERS=
ION_2)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19 @488  	bool port_enabled[N_MI=
PI_PORT_ID];
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  489  	bool any_port_enabled =
=3D false;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  490  	enum mipi_port_id port;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  491  =

bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  492  	if ((!config)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  493  	    || (config->mode >=
=3D N_RX_MODE)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  494  	    || (config->port >=
=3D N_MIPI_PORT_ID)) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  495  		assert(0);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  496  		return;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  497  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  498  	for (port =3D (enum mi=
pi_port_id)0; port < N_MIPI_PORT_ID; port++) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  499  		if (is_receiver_port_=
enabled(RX0_ID, port))
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  500  			any_port_enabled =3D=
 true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  501  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  502  	/* AM: Check whether t=
his is a problem with multiple
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  503  	 * streams. MS: This i=
s the case. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  504  =

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  505  	port =3D config->port;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  506  	receiver_port_enable(R=
X0_ID, port, false);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  507  =

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  508  	port =3D config->port;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  509  =

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  510  	/* AM: Check whether t=
his is a problem with multiple streams. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  511  	if (MIPI_PORT_LANES[co=
nfig->mode][port] !=3D MIPI_0LANE_CFG) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  512  		receiver_port_reg_sto=
re(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  513  					_HRT_CSS_RECEIVER_=
FUNC_PROG_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  514  					config->timeout);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  515  		receiver_port_reg_sto=
re(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  516  					_HRT_CSS_RECEIVER_=
2400_INIT_COUNT_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  517  					config->initcount);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  518  		receiver_port_reg_sto=
re(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  519  					_HRT_CSS_RECEIVER_=
2400_SYNC_COUNT_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  520  					config->synccount);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  521  		receiver_port_reg_sto=
re(RX0_ID, port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  522  					_HRT_CSS_RECEIVER_=
2400_RX_COUNT_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  523  					config->rxcount);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  524  =

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  525  		port_enabled[port] =
=3D true;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  526  =

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  527  		if (input_mode !=3D I=
A_CSS_INPUT_MODE_BUFFERED_SENSOR) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  528  			/* MW: A bit of a ha=
ck, straight wiring of the capture
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  529  			 * units,assuming th=
ey are linearly enumerated. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  530  			input_system_sub_sys=
tem_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  531  							  GPREGS_UNIT0_I=
D,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  532  							  HIVE_ISYS_GPRE=
G_MULTICAST_A_IDX
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  533  							  + (unsigned in=
t)port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  534  							  INPUT_SYSTEM_C=
SI_BACKEND);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  535  			/* MW: Like the inte=
gration test example we overwite,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  536  			 * the GPREG_MUX reg=
ister */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  537  			input_system_sub_sys=
tem_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  538  							  GPREGS_UNIT0_I=
D,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  539  							  HIVE_ISYS_GPRE=
G_MUX_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  540  							  (input_system_=
multiplex_t)port);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  541  		} else {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  542  			/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  543  			 * AM: A bit of a ha=
ck, wiring the input system.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  544  			 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  545  			input_system_sub_sys=
tem_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  546  							  GPREGS_UNIT0_I=
D,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  547  							  HIVE_ISYS_GPRE=
G_MULTICAST_A_IDX
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  548  							  + (unsigned in=
t)port,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  549  							  INPUT_SYSTEM_I=
NPUT_BUFFER);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  550  			input_system_sub_sys=
tem_reg_store(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  551  							  GPREGS_UNIT0_I=
D,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  552  							  HIVE_ISYS_GPRE=
G_MUX_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  553  							  INPUT_SYSTEM_A=
CQUISITION_UNIT);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  554  		}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  555  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  556  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  557  	 * The 2ppc is shared =
for all ports, so we cannot
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  558  	 * disable->configure-=
>enable individual ports
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  559  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  560  	/* AM: Check whether t=
his is a problem with multiple streams. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  561  	/* MS: 2ppc should be =
a property per binary and should be
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  562  	 * enabled/disabled pe=
r binary.
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  563  	 * Currently it is imp=
lemented as a system wide setting due
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  564  	 * to effort and risks=
. */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  565  	if (!any_port_enabled)=
 {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  566  		receiver_reg_store(RX=
0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  567  				   _HRT_CSS_RECEIVE=
R_TWO_PIXEL_EN_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  568  				   config->is_two_p=
pc);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  569  		receiver_reg_store(RX=
0_ID, _HRT_CSS_RECEIVER_BE_TWO_PPC_REG_IDX,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  570  				   config->is_two_p=
pc);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  571  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  572  	receiver_port_enable(R=
X0_ID, port, true);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  573  	/* TODO: JB: need to a=
dd the beneath used define to mizuchi */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  574  	/* sh_css_sw_hive_isp_=
css_2400_system_20121224_0125\css
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  575  	 *                    =
  \hrt\input_system_defs.h
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  576  	 * #define INPUT_SYSTE=
M_CSI_RECEIVER_SELECT_BACKENG 0X207
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  577  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  578  	/* TODO: need better n=
ame for define
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  579  	 * input_system_reg_st=
ore(INPUT_SYSTEM0_ID,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  580  	 *                INPU=
T_SYSTEM_CSI_RECEIVER_SELECT_BACKENG, 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  581  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  582  	input_system_reg_store=
(INPUT_SYSTEM0_ID, 0x207, 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  583  #else
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  584  #error "rx.c: RX versio=
n must be one of {RX_VERSION_2}"
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  585  #endif
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  586  =

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  587  	return;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  588  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/css2400/runtime/i=
sys/src/rx.c Mauro Carvalho Chehab 2020-04-19  589  =


:::::: The code at line 488 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: ato=
misp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8893908989817440074==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
/gfVK3q7bnoCAA==
--===============8893908989817440074==--

