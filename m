Content-Type: multipart/mixed; boundary="===============6508271109232493328=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-next:master 3391/10701] drivers/firmware/efi/libstub/efi-stub.c:148:14: warning: no previous prototype for function 'efi_entry'
Date: Wed, 20 May 2020 15:28:04 +0800
Message-ID: <202005201544.eSxyUcjp%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6508271109232493328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Atish,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
commit: 2e0eb483c058dd013be8e3d0ec1767be531485a2 [3391/10701] efi/libstub: =
Move arm-stub to a common file
config: arm64-randconfig-r026-20200519 (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 135b87=
7874fae96b4372c8a3fbfaa8ff44ff86e3)
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git checkout 2e0eb483c058dd013be8e3d0ec1767be531485a2
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/firmware/efi/libstub/efi-stub.c:68:6: warning: no previous prototyp=
e for function 'install_memreserve_table' [-Wmissing-prototypes]
void install_memreserve_table(void)
^
drivers/firmware/efi/libstub/efi-stub.c:68:1: note: declare 'static' if the=
 function is not intended to be used outside of this translation unit
void install_memreserve_table(void)
^
static
>> drivers/firmware/efi/libstub/efi-stub.c:148:14: warning: no previous pro=
totype for function 'efi_entry' [-Wmissing-prototypes]
efi_status_t efi_entry(efi_handle_t handle, efi_system_table_t *sys_table_a=
rg)
^
drivers/firmware/efi/libstub/efi-stub.c:148:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
efi_status_t efi_entry(efi_handle_t handle, efi_system_table_t *sys_table_a=
rg)
^
static
2 warnings generated.

vim +/efi_entry +148 drivers/firmware/efi/libstub/efi-stub.c

b844470f22061e drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2018=
-09-21  124  =

3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  125  /*
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  126   * This function handles the architcture specific differences =
between arm and
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  127   * arm64 regarding where the kernel image must be loaded and a=
ny memory that
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  128   * must be reserved. On failure it is required to free all
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  129   * all allocations it has made.
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  130   */
cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  131  efi_status_t handle_kernel_image(unsigned long *image_addr,
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  132  				 unsigned long *image_size,
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  133  				 unsigned long *reserve_addr,
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  134  				 unsigned long *reserve_size,
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  135  				 unsigned long dram_base,
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  136  				 efi_loaded_image_t *image);
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  137  =

9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  138  asmlinkage void __noreturn efi_enter_kernel(unsigned long entr=
ypoint,
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  139  					    unsigned long fdt_addr,
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  140  					    unsigned long fdt_size);
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  141  =

3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  142  /*
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  143   * EFI entry point for the arm/arm64 EFI stubs.  This is the e=
ntrypoint
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  144   * that is described in the PE/COFF header.  Most of the code =
is the same
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  145   * for both archictectures, with the arch-specific code provid=
ed in the
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  146   * handle_kernel_image() function.
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  147   */
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17 @148  efi_status_t efi_entry(efi_handle_t handle, efi_system_table_t=
 *sys_table_arg)
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  149  {
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  150  	efi_loaded_image_t *image;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  151  	efi_status_t status;
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  152  	unsigned long image_addr;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  153  	unsigned long image_size =3D 0;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  154  	unsigned long dram_base;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  155  	/* addr/point and size pairs for memory management*/
79d3219d4e56b3 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-04  156  	unsigned long initrd_addr =3D 0;
9302c1bb8e4758 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  157  	unsigned long initrd_size =3D 0;
345c736edd07b6 drivers/firmware/efi/arm-stub.c         Ard Biesheuvel  2014=
-04-03  158  	unsigned long fdt_addr =3D 0;  /* Original DTB */
a643375f4b1755 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2015=
-03-04  159  	unsigned long fdt_size =3D 0;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  160  	char *cmdline_ptr =3D NULL;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  161  	int cmdline_size =3D 0;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  162  	efi_guid_t loaded_image_proto =3D LOADED_IMAGE_PROTOCOL_GUID;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  163  	unsigned long reserve_addr =3D 0;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  164  	unsigned long reserve_size =3D 0;
de8cb458625c16 drivers/firmware/efi/libstub/arm-stub.c David Howells   2017=
-02-06  165  	enum efi_secureboot_mode secure_boot;
f0827e18a7a1da drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-04-25  166  	struct screen_info *si;
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  167  	efi_properties_table_t *prop_tbl;
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  168  	unsigned long max_addr;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  169  =

2fcdad2a80a6d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  170  	sys_table =3D sys_table_arg;
2fcdad2a80a6d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  171  =

3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  172  	/* Check if we were booted by the EFI firmware */
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  173  	if (sys_table->hdr.signature !=3D EFI_SYSTEM_TABLE_SIGNATURE)=
 {
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  174  		status =3D EFI_INVALID_PARAMETER;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  175  		goto fail;
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  176  	}
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  177  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  178  	status =3D check_platform_features();
b9d6769b5678db drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-02-17  179  	if (status !=3D EFI_SUCCESS)
b9d6769b5678db drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-02-17  180  		goto fail;
b9d6769b5678db drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-02-17  181  =

3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  182  	/*
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  183  	 * Get a handle to the loaded image protocol.  This is used t=
o get
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  184  	 * information about the running image, such as size and the =
command
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  185  	 * line.
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  186  	 */
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  187  	status =3D sys_table->boottime->handle_protocol(handle,
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  188  					&loaded_image_proto, (void *)&image);
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  189  	if (status !=3D EFI_SUCCESS) {
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  190  		pr_efi_err("Failed to get loaded image protocol\n");
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  191  		goto fail;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  192  	}
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  193  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  194  	dram_base =3D get_dram_base();
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  195  	if (dram_base =3D=3D EFI_ERROR) {
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  196  		pr_efi_err("Failed to find DRAM base\n");
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  197  		status =3D EFI_LOAD_ERROR;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  198  		goto fail;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  199  	}
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  200  =

3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  201  	/*
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  202  	 * Get the command line from EFI, using the LOADED_IMAGE
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  203  	 * protocol. We are going to copy the command line into the
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  204  	 * device tree, so this can be allocated anywhere.
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  205  	 */
1e45bf7372c48c drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  206  	cmdline_ptr =3D efi_convert_cmdline(image, &cmdline_size, ULO=
NG_MAX);
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  207  	if (!cmdline_ptr) {
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  208  		pr_efi_err("getting command line via LOADED_IMAGE_PROTOCOL\n=
");
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  209  		status =3D EFI_OUT_OF_RESOURCES;
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  210  		goto fail;
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  211  	}
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  212  =

eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  213  	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  214  	    IS_ENABLED(CONFIG_CMDLINE_FORCE) ||
eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  215  	    cmdline_size =3D=3D 0)
eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  216  		efi_parse_options(CONFIG_CMDLINE);
eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  217  =

eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  218  	if (!IS_ENABLED(CONFIG_CMDLINE_FORCE) && cmdline_size > 0)
eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  219  		efi_parse_options(cmdline_ptr);
eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  220  =

8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  221  	pr_efi("Booting Linux Kernel...\n");
eeff7d634f4750 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  222  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  223  	si =3D setup_graphics();
f0827e18a7a1da drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-04-25  224  =

9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  225  	status =3D handle_kernel_image(&image_addr, &image_size,
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  226  				     &reserve_addr,
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  227  				     &reserve_size,
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  228  				     dram_base, image);
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  229  	if (status !=3D EFI_SUCCESS) {
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  230  		pr_efi_err("Failed to relocate kernel\n");
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  231  		goto fail_free_cmdline;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  232  	}
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  233  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  234  	efi_retrieve_tpm2_eventlog();
d99c1ba6a73b9e drivers/firmware/efi/libstub/arm-stub.c Xinwei Kong     2019=
-11-07  235  =

ccc829ba3624be drivers/firmware/efi/libstub/arm-stub.c Matthew Garrett 2017=
-08-25  236  	/* Ask the firmware to clear memory on unclean shutdown */
cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  237  	efi_enable_reset_attack_mitigation();
ccc829ba3624be drivers/firmware/efi/libstub/arm-stub.c Matthew Garrett 2017=
-08-25  238  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  239  	secure_boot =3D efi_get_secureboot();
73a6492589c87c drivers/firmware/efi/libstub/arm-stub.c Linn Crosetto   2016=
-04-25  240  =

345c736edd07b6 drivers/firmware/efi/arm-stub.c         Ard Biesheuvel  2014=
-04-03  241  	/*
de8cb458625c16 drivers/firmware/efi/libstub/arm-stub.c David Howells   2017=
-02-06  242  	 * Unauthenticated device tree data is a security hazard, so =
ignore
de8cb458625c16 drivers/firmware/efi/libstub/arm-stub.c David Howells   2017=
-02-06  243  	 * 'dtb=3D' unless UEFI Secure Boot is disabled.  We assume t=
hat secure
de8cb458625c16 drivers/firmware/efi/libstub/arm-stub.c David Howells   2017=
-02-06  244  	 * boot is enabled if we can't determine its state.
345c736edd07b6 drivers/firmware/efi/arm-stub.c         Ard Biesheuvel  2014=
-04-03  245  	 */
3d7ee348aa4127 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2018=
-07-11  246  	if (!IS_ENABLED(CONFIG_EFI_ARMSTUB_DTB_LOADER) ||
3d7ee348aa4127 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2018=
-07-11  247  	     secure_boot !=3D efi_secureboot_mode_disabled) {
3d7ee348aa4127 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2018=
-07-11  248  		if (strstr(cmdline_ptr, "dtb=3D"))
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  249  			pr_efi("Ignoring DTB from command line.\n");
345c736edd07b6 drivers/firmware/efi/arm-stub.c         Ard Biesheuvel  2014=
-04-03  250  	} else {
9302c1bb8e4758 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  251  		status =3D efi_load_dtb(image, &fdt_addr, &fdt_size);
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  252  =

3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  253  		if (status !=3D EFI_SUCCESS) {
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  254  			pr_efi_err("Failed to load device tree!\n");
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  255  			goto fail_free_image;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  256  		}
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  257  	}
0bcaa9040d0586 drivers/firmware/efi/libstub/arm-stub.c Mark Rutland    2014=
-10-23  258  =

0bcaa9040d0586 drivers/firmware/efi/libstub/arm-stub.c Mark Rutland    2014=
-10-23  259  	if (fdt_addr) {
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  260  		pr_efi("Using DTB from command line\n");
0bcaa9040d0586 drivers/firmware/efi/libstub/arm-stub.c Mark Rutland    2014=
-10-23  261  	} else {
345c736edd07b6 drivers/firmware/efi/arm-stub.c         Ard Biesheuvel  2014=
-04-03  262  		/* Look for a device tree configuration table entry. */
cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  263  		fdt_addr =3D (uintptr_t)get_fdt(&fdt_size);
0bcaa9040d0586 drivers/firmware/efi/libstub/arm-stub.c Mark Rutland    2014=
-10-23  264  		if (fdt_addr)
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  265  			pr_efi("Using DTB from configuration table\n");
0bcaa9040d0586 drivers/firmware/efi/libstub/arm-stub.c Mark Rutland    2014=
-10-23  266  	}
0bcaa9040d0586 drivers/firmware/efi/libstub/arm-stub.c Mark Rutland    2014=
-10-23  267  =

0bcaa9040d0586 drivers/firmware/efi/libstub/arm-stub.c Mark Rutland    2014=
-10-23  268  	if (!fdt_addr)
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  269  		pr_efi("Generating empty DTB\n");
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  270  =

79d3219d4e56b3 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-04  271  	if (!noinitrd()) {
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  272  		max_addr =3D efi_get_max_initrd_addr(dram_base, image_addr);
79d3219d4e56b3 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-04  273  		status =3D efi_load_initrd_dev_path(&initrd_addr, &initrd_si=
ze,
79d3219d4e56b3 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-04  274  						  max_addr);
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  275  		if (status =3D=3D EFI_SUCCESS) {
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  276  			pr_efi("Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID devi=
ce path\n");
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  277  		} else if (status =3D=3D EFI_NOT_FOUND) {
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  278  			status =3D efi_load_initrd(image, &initrd_addr, &initrd_siz=
e,
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  279  						 ULONG_MAX, max_addr);
594e576d4b93b8 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-03-29  280  			if (status =3D=3D EFI_SUCCESS && initrd_size > 0)
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  281  				pr_efi("Loaded initrd from command line option\n");
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  282  		}
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  283  		if (status !=3D EFI_SUCCESS)
ec93fc371f014a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-03  284  			pr_efi_err("Failed to load initrd!\n");
79d3219d4e56b3 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-04  285  	}
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  286  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  287  	efi_random_get_seed();
568bc4e87033d2 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-11-12  288  =

b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  289  	/*
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  290  	 * If the NX PE data feature is enabled in the properties tab=
le, we
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  291  	 * should take care not to create a virtual mapping that chan=
ges the
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  292  	 * relative placement of runtime services code and data regio=
ns, as
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  293  	 * they may belong to the same PE/COFF executable image in me=
mory.
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  294  	 * The easiest way to achieve that is to simply use a 1:1 map=
ping.
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  295  	 */
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  296  	prop_tbl =3D get_efi_config_table(EFI_PROPERTIES_TABLE_GUID);
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  297  	flat_va_mapping =3D prop_tbl &&
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  298  			  (prop_tbl->memory_protection_attribute &
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  299  			   EFI_PROPERTIES_RUNTIME_MEMORY_PROTECTION_NON_EXECUTABLE_=
PE_DATA);
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  300  =

38fb6652229c21 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-10-25  301  	/* hibernation expects the runtime regions to stay in the sam=
e place */
b92165d2ba869a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-10  302  	if (!IS_ENABLED(CONFIG_HIBERNATION) && !nokaslr() && !flat_va=
_mapping) {
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  303  		/*
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  304  		 * Randomize the base of the UEFI runtime services region.
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  305  		 * Preserve the 2 MB alignment of the region by taking a
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  306  		 * shift of 21 bit positions into account when scaling
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  307  		 * the headroom value using a 32-bit random value.
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  308  		 */
197decefdb79d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-17  309  		static const u64 headroom =3D EFI_RT_VIRTUAL_LIMIT -
197decefdb79d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-17  310  					    EFI_RT_VIRTUAL_BASE -
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  311  					    EFI_RT_VIRTUAL_SIZE;
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  312  		u32 rnd;
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  313  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  314  		status =3D efi_get_random_bytes(sizeof(rnd), (u8 *)&rnd);
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  315  		if (status =3D=3D EFI_SUCCESS) {
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  316  			virtmap_base =3D EFI_RT_VIRTUAL_BASE +
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  317  				       (((headroom >> 21) * rnd) >> (32 - 21));
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  318  		}
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  319  	}
e69176d68d26d6 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2017=
-04-04  320  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  321  	install_memreserve_table();
b844470f22061e drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2018=
-09-21  322  =

9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  323  	status =3D allocate_new_fdt_and_exit_boot(handle, &fdt_addr,
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  324  						efi_get_max_fdt_addr(dram_base),
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  325  						initrd_addr, initrd_size,
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  326  						cmdline_ptr, fdt_addr, fdt_size);
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  327  	if (status !=3D EFI_SUCCESS)
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  328  		goto fail_free_initrd;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  329  =

9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  330  	efi_enter_kernel(image_addr, fdt_addr, fdt_totalsize((void *)=
fdt_addr));
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  331  	/* not reached */
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  332  =

9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  333  fail_free_initrd:
8173ec7905b5b0 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  334  	pr_efi_err("Failed to update FDT and exit boot services\n");
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  335  =

cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  336  	efi_free(initrd_size, initrd_addr);
cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  337  	efi_free(fdt_size, fdt_addr);
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  338  =

3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  339  fail_free_image:
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  340  	efi_free(image_size, image_addr);
cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  341  	efi_free(reserve_size, reserve_addr);
2b5fe07a78a09a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2016=
-01-26  342  fail_free_cmdline:
cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  343  	free_screen_info(si);
cd33a5c1d53e43 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2019=
-12-24  344  	efi_free(cmdline_size, (unsigned long)cmdline_ptr);
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  345  fail:
9f9223778ef385 drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2020=
-02-17  346  	return status;
3c7f255039a2ad drivers/firmware/efi/arm-stub.c         Mark Salter     2014=
-04-15  347  }
f3cdfd239da56a drivers/firmware/efi/libstub/arm-stub.c Ard Biesheuvel  2014=
-10-20  348  =


:::::: The code at line 148 was first introduced by commit
:::::: 9f9223778ef385e79dc67f5ee48ee4c1fb757f6b efi/libstub/arm: Make efi_e=
ntry() an ordinary PE/COFF entrypoint

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6508271109232493328==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AA==
--===============6508271109232493328==--

