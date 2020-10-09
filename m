Content-Type: multipart/mixed; boundary="===============0377552343111769541=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [block:tif-task_work 6/7] arch/arm/kernel/entry-v7m.S:62: Error: invalid constant (10f) after fixup
Date: Fri, 09 Oct 2020 12:44:49 +0800
Message-ID: <202010091243.DzL7Nbfv-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0377552343111769541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it tif-task_work
head:   74b93a5a63989c512773d5034c30f918dcb615bc
commit: f035301ebf1a830ccd29bd2e683a52fc79d6c6b9 [6/7] arm: add support for=
 TIF_NOTIFY_SIGNAL
config: arm-vf610m4_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git/commit/?id=3Df035301ebf1a830ccd29bd2e683a52fc79d6c6b9
        git remote add block https://git.kernel.org/pub/scm/linux/kernel/gi=
t/axboe/linux-block.git
        git fetch --no-tags block tif-task_work
        git checkout f035301ebf1a830ccd29bd2e683a52fc79d6c6b9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arm/kernel/entry-v7m.S: Assembler messages:
>> arch/arm/kernel/entry-v7m.S:62: Error: invalid constant (10f) after fixup

vim +62 arch/arm/kernel/entry-v7m.S

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  34  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  35  	.align	2
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  36  __irq_entry:
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  37  	v7m_exception_entry
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  38  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  39  	@
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  40  	@ Invoke the IRQ han=
dler
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  41  	@
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  42  	mrs	r0, ipsr
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  43  	ldr	r1, =3DV7M_xPSR_=
EXCEPTIONNO
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  44  	and	r0, r1
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  45  	sub	r0, #16
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  46  	mov	r1, sp
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  47  	stmdb	sp!, {lr}
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  48  	@ routine called wit=
h r0 =3D irq number, r1 =3D struct pt_regs *
bed859c1eea89fe Uwe Kleine-K=C3=B6nig 2013-07-30  49  	bl	nvic_handle_irq
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  50  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  51  	pop	{lr}
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  52  	@
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  53  	@ Check for any pend=
ing work if returning to user
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  54  	@
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  55  	ldr	r1, =3DBASEADDR_=
V7M_SCB
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  56  	ldr	r0, [r1, V7M_SCB=
_ICSR]
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  57  	tst	r0, V7M_SCB_ICSR=
_RETTOBASE
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  58  	beq	2f
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  59  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  60  	get_thread_info tsk
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  61  	ldr	r2, [tsk, #TI_FL=
AGS]
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21 @62  	tst	r2, #_TIF_WORK_M=
ASK
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  63  	beq	2f			@ no work p=
ending
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  64  	mov	r0, #V7M_SCB_ICS=
R_PENDSVSET
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  65  	str	r0, [r1, V7M_SCB=
_ICSR]	@ raise PendSV
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  66  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  67  2:
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  68  	@ registers r0-r3 an=
d r12 are automatically restored on exception
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  69  	@ return. r4-r7 were=
 not clobbered in v7m_exception_entry so for
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  70  	@ correctness they d=
on't need to be restored. So only r8-r11 must be
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  71  	@ restored here. The=
 easiest way to do so is to restore r0-r7, too.
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  72  	ldmia	sp!, {r0-r11}
5745eef6b813194 Russell King     2016-05-10  73  	add	sp, #PT_REGS_SIZE-S_IP
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  74  	cpsie	i
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  75  	bx	lr
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  76  ENDPROC(__irq_entry)
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  77  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  78  __pendsv_entry:
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  79  	v7m_exception_entry
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  80  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  81  	ldr	r1, =3DBASEADDR_=
V7M_SCB
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  82  	mov	r0, #V7M_SCB_ICS=
R_PENDSVCLR
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  83  	str	r0, [r1, V7M_SCB=
_ICSR]	@ clear PendSV
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  84  =

19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  85  	@ execute the pendin=
g work, including reschedule
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  86  	get_thread_info tsk
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  87  	mov	why, #0
440ee365d30adbc Ezequiel Garcia  2015-10-30  88  	b	ret_to_user_from_irq
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  89  ENDPROC(__pendsv_entr=
y)
19c4d593f0b4bd4 Uwe Kleine-K=C3=B6nig 2010-05-21  90  =


:::::: The code at line 62 was first introduced by commit
:::::: 19c4d593f0b4bd46f6d923a3e514719982a22058 ARM: ARMv7-M: Add support f=
or exception handling

:::::: TO: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
:::::: CC: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0377552343111769541==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
lkHSWCnOuan1XPqUwu5/KUeW4WeOAAA=
--===============0377552343111769541==--

