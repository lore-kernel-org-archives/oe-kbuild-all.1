Content-Type: multipart/mixed; boundary="===============7290233187600306334=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [intel-tdx:guest 47/63] drivers/acpi/acpica/hwsleep.c:119:25: warning: suggest braces around empty body in an 'if' statement
Date: Thu, 13 May 2021 17:25:16 +0800
Message-ID: <202105131703.tgNePJsP-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7290233187600306334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel/tdx.git guest
head:   8c20c364d1f52e432181d142054b1c2efa0ae6d3
commit: 96c781481b4771fb0fb4cc62072a6b1b50a0cea2 [47/63] x86/tdx: Skip WBIN=
VD instruction for TDX guest
config: ia64-randconfig-p001-20210513 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/96c781481b4771fb0fb4cc62072a6=
b1b50a0cea2
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout 96c781481b4771fb0fb4cc62072a6b1b50a0cea2
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dia64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/acpi/acpica/hwsleep.c: In function 'acpi_hw_legacy_sleep':
>> drivers/acpi/acpica/hwsleep.c:119:25: warning: suggest braces around emp=
ty body in an 'if' statement [-Wempty-body]
     119 |   ACPI_FLUSH_CPU_CACHE();
         |                         ^


vim +/if +119 drivers/acpi/acpica/hwsleep.c

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   17  =

709585765734e9 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14   18  #if (!ACPI_REDUCED_HARDWARE)	/* Entire module */
44f6c01242da4e drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-04-18   19  /**********************************************************=
*********************
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   20   *
2feec47d4c5f80 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14   21   * FUNCTION:    acpi_hw_legacy_sleep
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   22   *
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   23   * PARAMETERS:  sleep_state         - Which sleep state to =
enter
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   24   *
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   25   * RETURN:      Status
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   26   *
2feec47d4c5f80 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14   27   * DESCRIPTION: Enter a system sleep state via the legacy F=
ADT PM registers
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   28   *              THIS FUNCTION MUST BE CALLED WITH INTERRUPT=
S DISABLED
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   29   *
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   30   **********************************************************=
********************/
3f6f49c7854c92 drivers/acpi/acpica/hwsleep.c   Len Brown                  2=
012-07-26   31  acpi_status acpi_hw_legacy_sleep(u8 sleep_state)
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   32  {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   33  	struct acpi_bit_register_info *sleep_type_reg_info;
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   34  	struct acpi_bit_register_info *sleep_enable_reg_info;
2feec47d4c5f80 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14   35  	u32 pm1a_control;
2feec47d4c5f80 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14   36  	u32 pm1b_control;
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   37  	u32 in_value;
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   38  	acpi_status status;
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   39  =

2feec47d4c5f80 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14   40  	ACPI_FUNCTION_TRACE(hw_legacy_sleep);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   41  =

4be44fcd3bf648 drivers/acpi/hardware/hwsleep.c Len Brown                  2=
005-08-05   42  	sleep_type_reg_info =3D
82d79b86646504 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   43  	    acpi_hw_get_bit_register_info(ACPI_BITREG_SLEEP_TYPE);
4be44fcd3bf648 drivers/acpi/hardware/hwsleep.c Len Brown                  2=
005-08-05   44  	sleep_enable_reg_info =3D
4be44fcd3bf648 drivers/acpi/hardware/hwsleep.c Len Brown                  2=
005-08-05   45  	    acpi_hw_get_bit_register_info(ACPI_BITREG_SLEEP_ENABLE=
);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   46  =

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   47  	/* Clear wake status */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   48  =

1fad87385e7e82 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
015-12-29   49  	status =3D acpi_write_bit_register(ACPI_BITREG_WAKE_STATUS,
1fad87385e7e82 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
015-12-29   50  					 ACPI_CLEAR_STATUS);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   51  	if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   52  		return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   53  	}
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   54  =

fa85015c0d9588 drivers/acpi/acpica/hwsleep.c   Rafael J. Wysocki          2=
018-07-09   55  	/* Disable all GPEs */
fa85015c0d9588 drivers/acpi/acpica/hwsleep.c   Rafael J. Wysocki          2=
018-07-09   56  	status =3D acpi_hw_disable_all_gpes();
fa85015c0d9588 drivers/acpi/acpica/hwsleep.c   Rafael J. Wysocki          2=
018-07-09   57  	if (ACPI_FAILURE(status)) {
fa85015c0d9588 drivers/acpi/acpica/hwsleep.c   Rafael J. Wysocki          2=
018-07-09   58  		return_ACPI_STATUS(status);
fa85015c0d9588 drivers/acpi/acpica/hwsleep.c   Rafael J. Wysocki          2=
018-07-09   59  	}
fa85015c0d9588 drivers/acpi/acpica/hwsleep.c   Rafael J. Wysocki          2=
018-07-09   60  	status =3D acpi_hw_clear_acpi_status();
1d99967badac59 drivers/acpi/hardware/hwsleep.c Alexey Starikovskiy        2=
007-03-12   61  	if (ACPI_FAILURE(status)) {
1d99967badac59 drivers/acpi/hardware/hwsleep.c Alexey Starikovskiy        2=
007-03-12   62  		return_ACPI_STATUS(status);
1d99967badac59 drivers/acpi/hardware/hwsleep.c Alexey Starikovskiy        2=
007-03-12   63  	}
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   64  	acpi_gbl_system_awake_and_running =3D FALSE;
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   65  =

fa85015c0d9588 drivers/acpi/acpica/hwsleep.c   Rafael J. Wysocki          2=
018-07-09   66  	 /* Enable all wakeup GPEs */
73459f73e5d160 drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-06-24   67  	status =3D acpi_hw_enable_all_wakeup_gpes();
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   68  	if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   69  		return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   70  	}
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   71  =

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   72  	/* Get current value of PM1A control */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   73  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   74  	status =3D acpi_hw_register_read(ACPI_REGISTER_PM1_CONTROL,
32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   75  				       &pm1a_control);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   76  	if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   77  		return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   78  	}
44f6c01242da4e drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-04-18   79  	ACPI_DEBUG_PRINT((ACPI_DB_INIT,
b27d65975c252f drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
010-05-26   80  			  "Entering sleep state [S%u]\n", sleep_state));
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   81  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   82  	/* Clear the SLP_EN and SLP_TYP fields */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   83  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   84  	pm1a_control &=3D ~(sleep_type_reg_info->access_bit_mask |
44f6c01242da4e drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-04-18   85  			  sleep_enable_reg_info->access_bit_mask);
32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   86  	pm1b_control =3D pm1a_control;
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   87  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   88  	/* Insert the SLP_TYP bits */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   89  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   90  	pm1a_control |=3D
4be44fcd3bf648 drivers/acpi/hardware/hwsleep.c Len Brown                  2=
005-08-05   91  	    (acpi_gbl_sleep_type_a << sleep_type_reg_info->bit_pos=
ition);
32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18   92  	pm1b_control |=3D
4be44fcd3bf648 drivers/acpi/hardware/hwsleep.c Len Brown                  2=
005-08-05   93  	    (acpi_gbl_sleep_type_b << sleep_type_reg_info->bit_pos=
ition);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   94  =

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   95  	/*
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   96  	 * We split the writes of SLP_TYP and SLP_EN to workaround
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   97  	 * poorly implemented hardware.
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   98  	 */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16   99  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  100  	/* Write #1: write the SLP_TYP data to the PM1 Control reg=
isters */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  101  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  102  	status =3D acpi_hw_write_pm1_control(pm1a_control, pm1b_co=
ntrol);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  103  	if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  104  		return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  105  	}
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  106  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  107  	/* Insert the sleep enable (SLP_EN) bit */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  108  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  109  	pm1a_control |=3D sleep_enable_reg_info->access_bit_mask;
32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  110  	pm1b_control |=3D sleep_enable_reg_info->access_bit_mask;
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  111  =

96c781481b4771 drivers/acpi/acpica/hwsleep.c   Kuppuswamy Sathyanarayanan 2=
021-05-12  112  	/*
96c781481b4771 drivers/acpi/acpica/hwsleep.c   Kuppuswamy Sathyanarayanan 2=
021-05-12  113  	 * WBINVD instruction is not supported in TDX
96c781481b4771 drivers/acpi/acpica/hwsleep.c   Kuppuswamy Sathyanarayanan 2=
021-05-12  114  	 * guest. Since ACPI_FLUSH_CPU_CACHE() uses
96c781481b4771 drivers/acpi/acpica/hwsleep.c   Kuppuswamy Sathyanarayanan 2=
021-05-12  115  	 * WBINVD, skip cache flushes for TDX guests.
96c781481b4771 drivers/acpi/acpica/hwsleep.c   Kuppuswamy Sathyanarayanan 2=
021-05-12  116  	 */
96c781481b4771 drivers/acpi/acpica/hwsleep.c   Kuppuswamy Sathyanarayanan 2=
021-05-12  117  	if (!protected_guest_has(GUEST_TYPE_TDX))
32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  118  		/* Flush caches, as per ACPI specification */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16 @119  		ACPI_FLUSH_CPU_CACHE();
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  120  =

0fc5e8f4e4b33d drivers/acpi/acpica/hwsleep.c   Lv Zheng                   2=
016-12-28  121  	status =3D acpi_os_enter_sleep(sleep_state, pm1a_control, =
pm1b_control);
0fc5e8f4e4b33d drivers/acpi/acpica/hwsleep.c   Lv Zheng                   2=
016-12-28  122  	if (status =3D=3D AE_CTRL_TERMINATE) {
09f98a825a821f drivers/acpi/acpica/hwsleep.c   Tang Liang                 2=
011-12-09  123  		return_ACPI_STATUS(AE_OK);
0fc5e8f4e4b33d drivers/acpi/acpica/hwsleep.c   Lv Zheng                   2=
016-12-28  124  	}
0fc5e8f4e4b33d drivers/acpi/acpica/hwsleep.c   Lv Zheng                   2=
016-12-28  125  	if (ACPI_FAILURE(status)) {
09f98a825a821f drivers/acpi/acpica/hwsleep.c   Tang Liang                 2=
011-12-09  126  		return_ACPI_STATUS(status);
0fc5e8f4e4b33d drivers/acpi/acpica/hwsleep.c   Lv Zheng                   2=
016-12-28  127  	}
0fc5e8f4e4b33d drivers/acpi/acpica/hwsleep.c   Lv Zheng                   2=
016-12-28  128  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  129  	/* Write #2: Write both SLP_TYP + SLP_EN */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  130  =

32c9ef994d9135 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-18  131  	status =3D acpi_hw_write_pm1_control(pm1a_control, pm1b_co=
ntrol);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  132  	if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  133  		return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  134  	}
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  135  =

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  136  	if (sleep_state > ACPI_STATE_S3) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  137  		/*
44f6c01242da4e drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-04-18  138  		 * We wanted to sleep > S3, but it didn't happen (by virt=
ue of the
44f6c01242da4e drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-04-18  139  		 * fact that we are still executing!)
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  140  		 *
44f6c01242da4e drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-04-18  141  		 * Wait ten seconds, then try again. This is to get S4/S5=
 to work on
44f6c01242da4e drivers/acpi/hardware/hwsleep.c Robert Moore               2=
005-04-18  142  		 * all machines.
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  143  		 *
d4913dc6d0c680 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-03-06  144  		 * We wait so long to allow chipsets that poll this reg v=
ery slowly
d4913dc6d0c680 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-03-06  145  		 * to still read the right value. Ideally, this block wou=
ld go
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  146  		 * away entirely.
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  147  		 */
c41679a4481d5b drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-12-31  148  		acpi_os_stall(10 * ACPI_USEC_PER_SEC);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  149  =

d30dc9abb4aacf drivers/acpi/hardware/hwsleep.c Alexey Starikovskiy        2=
007-09-30  150  		status =3D acpi_hw_register_write(ACPI_REGISTER_PM1_CONTR=
OL,
4be44fcd3bf648 drivers/acpi/hardware/hwsleep.c Len Brown                  2=
005-08-05  151  						sleep_enable_reg_info->
4be44fcd3bf648 drivers/acpi/hardware/hwsleep.c Len Brown                  2=
005-08-05  152  						access_bit_mask);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  153  		if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  154  			return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  155  		}
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  156  	}
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  157  =

2feec47d4c5f80 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14  158  	/* Wait for transition back to Working State */
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  159  =

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  160  	do {
50ffba1bd3120b drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-23  161  		status =3D
50ffba1bd3120b drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
009-02-23  162  		    acpi_read_bit_register(ACPI_BITREG_WAKE_STATUS, &in_v=
alue);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  163  		if (ACPI_FAILURE(status)) {
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  164  			return_ACPI_STATUS(status);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  165  		}
2feec47d4c5f80 drivers/acpi/acpica/hwsleep.c   Bob Moore                  2=
012-02-14  166  =

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  167  	} while (!in_value);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  168  =

^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  169  	return_ACPI_STATUS(AE_OK);
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  170  }
^1da177e4c3f41 drivers/acpi/hardware/hwsleep.c Linus Torvalds             2=
005-04-16  171  =


:::::: The code at line 119 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7290233187600306334==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AA==
--===============7290233187600306334==--

