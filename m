Content-Type: multipart/mixed; boundary="===============2382169853855427699=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [s390:features 73/81] drivers/s390/crypto/ap_queue.c:201:18: warning: format specifies type 'unsigned char' but the argument has type 'int'
Date: Thu, 08 Oct 2020 07:41:31 +0800
Message-ID: <202010080727.HGqasHVn-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2382169853855427699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git feat=
ures
head:   eefc69a09ca5b441ee136f9fb68ab5970cfc2d51
commit: 2ea2a6099ae3d1708f90f43c81a98cba3d4bb74c [73/81] s390/ap: add error=
 response code field for ap queue devices
config: s390-randconfig-r016-20201008 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 4d1d8a=
e7100ec3c7e1709addb7b3ec6f9ad0b44f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/co=
mmit/?id=3D2ea2a6099ae3d1708f90f43c81a98cba3d4bb74c
        git remote add s390 https://git.kernel.org/pub/scm/linux/kernel/git=
/s390/linux.git
        git fetch --no-tags s390 features
        git checkout 2ea2a6099ae3d1708f90f43c81a98cba3d4bb74c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/s390/crypto/ap_queue.c:201:18: warning: format specifies type 'u=
nsigned char' but the argument has type 'int' [-Wformat]
                               __func__, status.response_code,
                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/crypto/ap_debug.h:26:47: note: expanded from macro 'AP_DBF_=
WARN'
           debug_sprintf_event(ap_dbf_info, DBF_WARN, ##__VA_ARGS__)
                                                        ^~~~~~~~~~~
   arch/s390/include/asm/debug.h:256:21: note: expanded from macro 'debug_s=
printf_event'
                                                 _fmt, ## __VA_ARGS__);    \
                                                 ~~~~     ^~~~~~~~~~~
   drivers/s390/crypto/ap_queue.c:255:18: warning: format specifies type 'u=
nsigned char' but the argument has type 'int' [-Wformat]
                               __func__, status.response_code,
                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/crypto/ap_debug.h:26:47: note: expanded from macro 'AP_DBF_=
WARN'
           debug_sprintf_event(ap_dbf_info, DBF_WARN, ##__VA_ARGS__)
                                                        ^~~~~~~~~~~
   arch/s390/include/asm/debug.h:256:21: note: expanded from macro 'debug_s=
printf_event'
                                                 _fmt, ## __VA_ARGS__);    \
                                                 ~~~~     ^~~~~~~~~~~
   drivers/s390/crypto/ap_queue.c:298:18: warning: format specifies type 'u=
nsigned char' but the argument has type 'int' [-Wformat]
                               __func__, status.response_code,
                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/crypto/ap_debug.h:26:47: note: expanded from macro 'AP_DBF_=
WARN'
           debug_sprintf_event(ap_dbf_info, DBF_WARN, ##__VA_ARGS__)
                                                        ^~~~~~~~~~~
   arch/s390/include/asm/debug.h:256:21: note: expanded from macro 'debug_s=
printf_event'
                                                 _fmt, ## __VA_ARGS__);    \
                                                 ~~~~     ^~~~~~~~~~~
   drivers/s390/crypto/ap_queue.c:341:18: warning: format specifies type 'u=
nsigned char' but the argument has type 'int' [-Wformat]
                               __func__, status.response_code,
                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/crypto/ap_debug.h:26:47: note: expanded from macro 'AP_DBF_=
WARN'
           debug_sprintf_event(ap_dbf_info, DBF_WARN, ##__VA_ARGS__)
                                                        ^~~~~~~~~~~
   arch/s390/include/asm/debug.h:256:21: note: expanded from macro 'debug_s=
printf_event'
                                                 _fmt, ## __VA_ARGS__);    \
                                                 ~~~~     ^~~~~~~~~~~
   drivers/s390/crypto/ap_queue.c:382:18: warning: format specifies type 'u=
nsigned char' but the argument has type 'int' [-Wformat]
                               __func__, status.response_code,
                                         ^~~~~~~~~~~~~~~~~~~~
   drivers/s390/crypto/ap_debug.h:26:47: note: expanded from macro 'AP_DBF_=
WARN'
           debug_sprintf_event(ap_dbf_info, DBF_WARN, ##__VA_ARGS__)
                                                        ^~~~~~~~~~~
   arch/s390/include/asm/debug.h:256:21: note: expanded from macro 'debug_s=
printf_event'
                                                 _fmt, ## __VA_ARGS__);    \
                                                 ~~~~     ^~~~~~~~~~~
   5 warnings generated.

vim +201 drivers/s390/crypto/ap_queue.c

   170	=

   171	/**
   172	 * ap_sm_read(): Receive pending reply messages from an AP queue.
   173	 * @aq: pointer to the AP queue
   174	 *
   175	 * Returns AP_SM_WAIT_NONE, AP_SM_WAIT_AGAIN, or AP_SM_WAIT_INTERRUPT
   176	 */
   177	static enum ap_sm_wait ap_sm_read(struct ap_queue *aq)
   178	{
   179		struct ap_queue_status status;
   180	=

   181		if (!aq->reply)
   182			return AP_SM_WAIT_NONE;
   183		status =3D ap_sm_recv(aq);
   184		switch (status.response_code) {
   185		case AP_RESPONSE_NORMAL:
   186			if (aq->queue_count > 0) {
   187				aq->sm_state =3D AP_SM_STATE_WORKING;
   188				return AP_SM_WAIT_AGAIN;
   189			}
   190			aq->sm_state =3D AP_SM_STATE_IDLE;
   191			return AP_SM_WAIT_NONE;
   192		case AP_RESPONSE_NO_PENDING_REPLY:
   193			if (aq->queue_count > 0)
   194				return AP_SM_WAIT_INTERRUPT;
   195			aq->sm_state =3D AP_SM_STATE_IDLE;
   196			return AP_SM_WAIT_NONE;
   197		default:
   198			aq->dev_state =3D AP_DEV_STATE_ERROR;
   199			aq->last_err_rc =3D status.response_code;
   200			AP_DBF_WARN("%s RC 0x%02hhx on 0x%02x.%04x -> AP_DEV_STATE_ERROR\n=
",
 > 201				    __func__, status.response_code,
   202				    AP_QID_CARD(aq->qid), AP_QID_QUEUE(aq->qid));
   203			return AP_SM_WAIT_NONE;
   204		}
   205	}
   206	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2382169853855427699==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
6Imx9tJfAQA=
--===============2382169853855427699==--

