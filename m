Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703C1DFD84
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728591937; cv=none; b=cKZyumTyo8tvtxIVxVAJd+itAqcQIJjQDGdUmoQR13KLixCIrZWN8z6TXt1+nnUFeoZg0zyHlsp03wI2GlBeXX18AZysq/ao6Rhl6rj/Q6thdwIUZKlYJUx0w6oWKiW5HXQnnWaK/0c7Aht+icadyHLI2n5iJXKH0O/O8SQPUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728591937; c=relaxed/simple;
	bh=kQQOybt8szEKQPteG8SgoQse61WPBCSHCBYJpNDslx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcVRWE++bqG3dGFBOKYX4l3oZUs6dWL90WLl1u0sal1BpQ7B1mqaWnVXWvD5tMf0QCZuno1ec18mxJH9ADhxtt1GJmDAFh11ySzzoyydTIOwD8u2ahtYzIXh5NbSG0w1vVcSC0LynlOeddMbNJ1tRh31vCb+NxTnpq6mSb6gxy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2SFLoWi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2SFLoWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728591934; x=1760127934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kQQOybt8szEKQPteG8SgoQse61WPBCSHCBYJpNDslx4=;
  b=g2SFLoWieqjllNviVQ83EsQhVXeIENUJUh0pLM5UW4aPrmbSePReLlFB
   E7m8hxR3suBcFxPueKnCDiJpr7LuYfMvDub6bu2RTan0TgCRUcZPjPN8G
   GNXudewJ/4oXwvHF4UZoxnaF8Y3RHjQ6+/lb64kDEVCiwxB7rpOkGUY3g
   M1XAoPu6ZCw6Jbp2xYgCbOoINYJJKE6Xv3Ncv9ZMF19jdl5Dk3RIKAtrK
   JDJjjtBrJ4/cNpA/qYeq0fXDowcawtMrintrNthEzqr08uU6574TQPnZd
   4a7gs5ZjlkeKnA0TfdHNku7WVrbx1PMDQFk32vwq3ThLvei0S7VveG3Tw
   A==;
X-CSE-ConnectionGUID: yttL0zvdRQOJLotBB5OWKA==
X-CSE-MsgGUID: jGcpAimgSGySI++iH8m2DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27851910"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="27851910"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 13:25:33 -0700
X-CSE-ConnectionGUID: yCfZfsG1RISxGqPctjpaYA==
X-CSE-MsgGUID: cs4mAhTBSdqtYgu0ZrzF7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="100041604"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Oct 2024 13:25:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syziz-000BEP-1G;
	Thu, 10 Oct 2024 20:25:29 +0000
Date: Fri, 11 Oct 2024 04:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 84/90]
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: linux/uaccess.h is
 included more than once.
Message-ID: <202410110406.mQENnj09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   ac58041210cb96802c85aa7803e9d768086f043d
commit: fce79512a96afacbe297ba3c5c2f7ed34944540d [84/90] staging: gpib: Add LPVO DIY USB GPIB driver
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110406.mQENnj09-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c: linux/uaccess.h is included more than once.

vim +28 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c

    12	
    13	#include <linux/version.h>
    14	#include <linux/module.h>
    15	#include <linux/sched.h>
    16	#include <linux/init.h>
    17	#include <linux/kernel.h>
    18	#include <linux/tty.h>
    19	#include <linux/types.h>
    20	#include <linux/slab.h>
    21	#include <linux/mm.h>
    22	#include <linux/vmalloc.h>
    23	#include <linux/spinlock.h>
    24	#include <linux/file.h>
    25	#include <linux/timer.h>
    26	#include <linux/delay.h>
    27	#include <linux/sched/signal.h>
  > 28	#include <linux/uaccess.h>
    29	#include <linux/usb.h>
    30	
    31	#include "gpibP.h"
    32	
    33	MODULE_LICENSE("GPL");
    34	
    35	#define NAME "lpvo_usb_gpib"
    36	
    37	/*
    38	 *  Table of devices that work with this driver.
    39	 *
    40	 *  Currently, only one device is known to be used in the
    41	 *  lpvo_usb_gpib adapter (FTDI 0403:6001).
    42	 *  If your adapter uses a different chip, insert a line
    43	 *  in the following table with proper <Vendor-id>, <Product-id>.
    44	 *
    45	 *  To have your chip automatically handled by the driver,
    46	 *  update files "/usr/local/etc/modprobe.d/lpvo_usb_gpib.conf"
    47	 *  and /usr/local/etc/udev/rules.d/99-lpvo_usb_gpib.rules.
    48	 *
    49	 */
    50	
    51	static const struct usb_device_id skel_table[] = {
    52		{ USB_DEVICE(0x0403, 0x6001) },
    53		{ }					   /* Terminating entry */
    54	};
    55	MODULE_DEVICE_TABLE(usb, skel_table);
    56	
    57	/*
    58	 *    ***  Diagnostics and Debug  ***
    59	 *
    60	 *  The module parameter "debug" controls the sending of debug messages to
    61	 *  syslog. By default it is set to 0 or 1 according to GPIB_CONFIG_KERNEL_DEBUG.
    62	 *    debug = 0: only register/deregister messages are generated
    63	 *	      1: every action is logged
    64	 *	      2: extended logging; each single exchanged byte is documented
    65	 *		 (about twice the log volume of [1])
    66	 *    To switch debug level:
    67	 *	      At module loading:  modprobe lpvo_usb_gpib debug={0,1,2}
    68	 *	      On the fly: echo {0,1,2} > /sys/modules/lpvo_usb_gpib/parameters/debug
    69	 */
    70	#ifdef GPIB_DEBUG
    71	static int debug = 1;
    72	#else
    73	static int debug;
    74	#endif
    75	module_param(debug, int, 0644);
    76	
    77	#define DIA_LOG(level, format, ...)					\
    78		do { if (debug >= (level))					\
    79				pr_alert("%s:%s - " format, NAME, __func__, ## __VA_ARGS__); } \
    80		while (0)
    81	
    82	/* standard and extended command sets of the usb-gpib adapter */
    83	
    84	#define USB_GPIB_ON	 "\nIB\n"
    85	#define USB_GPIB_OFF	 "\nIBO\n"
    86	#define USB_GPIB_IBm0	 "\nIBm0\n"   /* do not assert REN with IFC */
    87	#define USB_GPIB_IBm1	 "\nIBm1\n"   /* assert REN with IFC */
    88	#define USB_GPIB_IBCL	 "\nIBZ\n"
    89	#define USB_GPIB_STATUS	 "\nIBS\n"
    90	#define USB_GPIB_READ	 "\nIB?\n"
    91	#define USB_GPIB_READ_1	 "\nIBB\n"
    92	#define USB_GPIB_EOI	 "\nIBe0\n"
    93	#define USB_GPIB_FTMO	 "\nIBf0\n"    /* disable first byte timeout */
    94	#define USB_GPIB_TTMOZ	 "\nIBt0\n"    /* disable byte timeout */
    95	
    96	/* incomplete commands */
    97	
    98	#define USB_GPIB_BTMO	 "\nIBt"      /* set byte timeout */
    99	#define USB_GPIB_TTMO	 "\nIBT"      /* set total timeout */
   100	
   101	#define USB_GPIB_DEBUG_ON    "\nIBDE\xAA\n"
   102	#define USB_GPIB_SET_LISTEN  "\nIBDT0\n"
   103	#define USB_GPIB_SET_TALK    "\nIBDT1\n"
   104	#define USB_GPIB_SET_LINES   "\nIBDC\n"
   105	#define USB_GPIB_SET_DATA    "\nIBDM\n"
   106	#define USB_GPIB_READ_LINES  "\nIBD?C\n"
   107	#define USB_GPIB_READ_DATA   "\nIBD?M\n"
   108	#define USB_GPIB_READ_BUS    "\nIBD??\n"
   109	
   110	/* command sequences */
   111	
   112	#define USB_GPIB_UNTALK "\nIBC_\n"
   113	#define USB_GPIB_UNLISTEN "\nIBC?\n"
   114	
   115	/* special characters used by the adapter */
   116	
   117	#define DLE ('\020')
   118	#define STX ('\02')
   119	#define ETX ('\03')
   120	#define ACK ('\06')
   121	#define NODATA ('\03')
   122	#define NODAV ('\011')
   123	
   124	#define IB_BUS_REN  0x01
   125	#define IB_BUS_IFC  0x02
   126	#define IB_BUS_NDAC 0x04
   127	#define IB_BUS_NRFD 0x08
   128	#define IB_BUS_DAV  0x10
   129	#define IB_BUS_EOI  0x20
   130	#define IB_BUS_ATN  0x40
   131	#define IB_BUS_SRQ  0x80
   132	
   133	#define INBUF_SIZE 128
   134	
   135	struct char_buf {		/* used by one_char() routine */
   136		char *inbuf;
   137		int last;
   138		int nchar;
   139	};
   140	
   141	struct usb_gpib_priv {		/* private data to the device */
   142		u8 eos;		        /* eos character */
   143		short eos_flags;	/* eos mode */
   144		int timeout;		/* current value for timeout */
   145		void *dev;		/* the usb device private data structure */
   146	};
   147	
   148	#define GPIB_DEV (((struct usb_gpib_priv *)board->private_data)->dev)
   149	
   150	#define SHOW_STATUS(board) {						\
   151			DIA_LOG(2, "# - board %p\n", board);			\
   152			DIA_LOG(2, "# - buffer_length %d\n", board->buffer_length); \
   153			DIA_LOG(2, "# - status %lx\n", board->status);		\
   154			DIA_LOG(2, "# - use_count %d\n", board->use_count);	\
   155			DIA_LOG(2, "# - pad %x\n", board->pad);			\
   156			DIA_LOG(2, "# - sad %x\n", board->sad);			\
   157			DIA_LOG(2, "# - timeout %d\n", board->usec_timeout);	\
   158			DIA_LOG(2, "# - ppc %d\n", board->parallel_poll_configuration); \
   159			DIA_LOG(2, "# - t1delay %d\n", board->t1_nano_sec);	\
   160			DIA_LOG(2, "# - online %d\n", board->online);		\
   161			DIA_LOG(2, "# - autopoll %d\n", board->autospollers);	\
   162			DIA_LOG(2, "# - autopoll task %p\n", board->autospoll_task); \
   163			DIA_LOG(2, "# - minor %d\n", board->minor);		\
   164			DIA_LOG(2, "# - master %d\n", board->master);		\
   165			DIA_LOG(2, "# - list %d\n", board->ist);		\
   166		}
   167	/*
   168	 * n = 0;
   169	 * list_for_each (l, &board->device_list) n++;
   170	 * TTY_LOG ("%s:%s - devices in list %d\n", a, b, n);
   171	 */
   172	
   173	/*
   174	 * TTY_LOG - write a message to the current work terminal (if any)
   175	 */
   176	
   177	#define TTY_LOG(format, ...) {						\
   178			char buf[128];						\
   179			struct tty_struct *tty = get_current_tty();		\
   180			if (tty) {						\
   181				snprintf(buf, 128, format, __VA_ARGS__);	\
   182				tty->driver->ops->write(tty, buf, strlen(buf)); \
   183				tty->driver->ops->write(tty, "\r", 1);		\
   184			}							\
   185		}
   186	
   187	/*
   188	 *  GLOBAL VARIABLES: required for
   189	 *  pairing among gpib minor and usb minor.
   190	 *  MAX_DEV is the max number of usb-gpib adapters; free
   191	 *  to change as you like, but no more than 32
   192	 */
   193	
   194	#define MAX_DEV 8
   195	static struct usb_interface *lpvo_usb_interfaces[MAX_DEV];   /* registered interfaces */
   196	static int usb_minors[MAX_DEV];			   /* usb minors */
   197	static int assigned_usb_minors;		   /* mask of filled slots */
   198	static struct mutex minors_lock;     /* operations on usb_minors are to be protected */
   199	
   200	/*
   201	 *  usb-skeleton prototypes
   202	 */
   203	
   204	struct usb_skel;
   205	static ssize_t skel_do_write(struct usb_skel *, const char *, size_t);
   206	static ssize_t skel_do_read(struct usb_skel *, char *, size_t);
   207	static int skel_do_open(gpib_board_t *, int);
   208	static int skel_do_release(gpib_board_t *);
   209	
   210	/*
   211	 *   usec_diff : take difference in MICROsec between two 'timespec'
   212	 *		 (unix time in sec and NANOsec)
   213	 */
   214	
   215	inline int usec_diff(struct timespec64 *a, struct timespec64 *b)
   216	{
   217		return ((a->tv_sec - b->tv_sec) * 1000000 +
   218			(a->tv_nsec - b->tv_nsec) / 1000);
   219	}
   220	
   221	/*
   222	 *   ***  these routines are specific to the usb-gpib adapter  ***
   223	 */
   224	
   225	/**
   226	 * write_loop() - Send a byte sequence to the adapter
   227	 *
   228	 * @dev:      the private device structure
   229	 * @msg:      the byte sequence.
   230	 * @leng:     the byte sequence length.
   231	 *
   232	 */
   233	
   234	static int write_loop(void *dev, char *msg, int leng)
   235	{
   236	//	  int nchar = 0, val;
   237	
   238	//	  do {
   239	
   240		return skel_do_write(dev, msg, leng);
   241	
   242	//		  if (val < 1) {
   243	//			  printk (KERN_ALERT "%s:%s - write error: %d %d/%d\n",
   244	//				  NAME, __func__, val, nchar, leng);
   245	//			  return -EIO;
   246	//		  }
   247	//		  nchar +=val;
   248	//	  } while (nchar < leng);
   249	//	  return leng;
   250	}
   251	
   252	static char printable(char x)
   253	{
   254		if (x < 32 || x > 126)
   255			return ' ';
   256		return x;
   257	}
   258	
   259	/**
   260	 * send_command() - Send a byte sequence and return a single byte reply.
   261	 *
   262	 * @board:    the gpib_board_struct data area for this gpib interface
   263	 * @msg:      the byte sequence.
   264	 * @leng      the byte sequence length; can be given as zero and is
   265	 *	      computed automatically, but if 'msg' contains a zero byte,
   266	 *	      it has to be given explicitly.
   267	 */
   268	
   269	static int send_command(gpib_board_t *board, char *msg, int leng)
   270	{
   271		char buffer[64];
   272		int nchar, j;
   273		int retval;
   274		struct timespec64 before, after;
   275	
   276		ktime_get_real_ts64 (&before);
   277	
   278		if (!leng)
   279			leng = strlen(msg);
   280		retval = write_loop(GPIB_DEV, msg, leng);
   281		if (retval < 0)
   282			return retval;
   283	
   284		nchar = skel_do_read(GPIB_DEV, buffer, 64);
   285	
   286		if (nchar < 0) {
   287			DIA_LOG(0, " return from read: %d\n", nchar);
   288			return nchar;
   289		} else if (nchar != 1) {
   290			for (j = 0 ; j < leng ; j++) {
   291				DIA_LOG(0, " Irregular reply to command: %d  %x %c\n",
   292					j, msg[j], printable(msg[j]));
   293			}
   294			for (j = 0 ; j < nchar ; j++) {
   295				DIA_LOG(0, " Irregular command reply: %d %x %c\n",
   296					j, buffer[j] & 0xff, printable(buffer[j]));
   297			}
   298			return -EIO;
   299		}
   300		ktime_get_real_ts64 (&after);
   301	
   302		DIA_LOG(1, "Sent %d - done %d us.\n", leng, usec_diff(&after, &before));
   303	
   304		return buffer[0] & 0xff;
   305	}
   306	
   307	/*
   308	 *
   309	 * set_control_line() - Set the value of a single gpib control line
   310	 *
   311	 * @board:    the gpib_board_struct data area for this gpib interface
   312	 * @line:     line mask
   313	 * @value:    line new value (0/1)
   314	 *
   315	 */
   316	
   317	static int set_control_line(gpib_board_t *board, int line, int value)
   318	{
   319		char msg[] = USB_GPIB_SET_LINES;
   320		int retval;
   321		int leng = strlen(msg);
   322	
   323		DIA_LOG(1, "setting line %x to %x\n", line, value);
   324	
   325		retval = send_command(board, USB_GPIB_READ_LINES, 0);
   326	
   327		DIA_LOG(1, "old line values: %x\n", retval);
   328	
   329		if (retval == -EIO)
   330			return retval;
   331	
   332		msg[leng - 2] = value ? (retval & ~line) : retval | line;
   333	
   334		retval = send_command(board, msg, 0);
   335	
   336		DIA_LOG(1, "operation result: %x\n", retval);
   337	
   338		return retval;
   339	}
   340	
   341	/*
   342	 * one_char() - read one single byte from input buffer
   343	 *
   344	 * @board:      the gpib_board_struct data area for this gpib interface
   345	 * @char_buf:   the routine private data structure
   346	 */
   347	
   348	static int one_char(gpib_board_t *board, struct char_buf *b)
   349	{
   350		struct timespec64 before, after;
   351	
   352		if (b->nchar) {
   353			DIA_LOG(2, "-> %x\n", b->inbuf[b->last - b->nchar]);
   354			return b->inbuf[b->last - b->nchar--];
   355		}
   356		ktime_get_real_ts64 (&before);
   357		b->nchar = skel_do_read(GPIB_DEV, b->inbuf, INBUF_SIZE);
   358		b->last = b->nchar;
   359		ktime_get_real_ts64 (&after);
   360	
   361		DIA_LOG(2, "read %d bytes in %d usec\n",
   362			b->nchar, usec_diff(&after, &before));
   363	
   364		if (b->nchar > 0) {
   365			DIA_LOG(2, "--> %x\n", b->inbuf[b->last - b->nchar]);
   366			return b->inbuf[b->last - b->nchar--];
   367		} else if (b->nchar == 0) {
   368			pr_alert("%s:%s - read returned EOF\n", NAME, __func__);
   369			return -EIO;
   370		}
   371		pr_alert("%s:%s - read error %d\n", NAME, __func__, b->nchar);
   372		TTY_LOG("\n *** %s *** Read Error - %s\n", NAME,
   373			"Reset the adapter with 'gpib_config'\n");
   374		return -EIO;
   375	}
   376	
   377	/**
   378	 * set_timeout() - set single byte / total timeouts on the adapter
   379	 *
   380	 * @board:    the gpib_board_struct data area for this gpib interface
   381	 *
   382	 *	   For sake of speed, the operation is performed only if it
   383	 *	   modifies the current (saved) value. Minimum allowed timeout
   384	 *	   is 30 ms (T30ms -> 8); timeout disable (TNONE -> 0) currently
   385	 *	   not supported.
   386	 */
   387	
   388	static void set_timeout(gpib_board_t *board)
   389	{
   390		int n, val;
   391		char command[sizeof(USB_GPIB_TTMO) + 6];
   392		struct usb_gpib_priv *data = board->private_data;
   393	
   394		if (data->timeout == board->usec_timeout)
   395			return;
   396	
   397		n = (board->usec_timeout + 32767) / 32768;
   398		if (n < 2)
   399			n = 2;
   400	
   401		DIA_LOG(1, "Set timeout to %d us -> %d\n", board->usec_timeout, n);
   402	
   403		sprintf(command, "%s%d\n", USB_GPIB_BTMO, n > 255 ? 255 : n);
   404		val = send_command(board, command, 0);
   405	
   406		if (val == ACK) {
   407			if (n > 65535)
   408				n = 65535;
   409			sprintf(command, "%s%d\n", USB_GPIB_TTMO, n);
   410			val = send_command(board, command, 0);
   411		}
   412	
   413		if (val != ACK) {
   414			pr_alert("%s:%s - error in timeout set: <%s>\n",
   415				 NAME, __func__, command);
   416		} else {
   417			data->timeout = board->usec_timeout;
   418		}
   419	}
   420	
   421	/*
   422	 *    now the standard interface functions - attach and detach
   423	 */
   424	
   425	/**
   426	 * usb_gpib_attach() - activate the usb-gpib converter board
   427	 *
   428	 * @board:    the gpib_board_struct data area for this gpib interface
   429	 * @config:   firmware data, if any (from gpib_config -I <file>)
   430	 *
   431	 * The channel name is ttyUSBn, with n=0 by default. Other values for n
   432	 * passed with gpib_config -b <n>.
   433	 *
   434	 * In this routine I trust that when an error code is returned
   435	 * detach() will be called. Always.
   436	 */
   437	
   438	static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *config)
   439	{
   440		int retval, j;
   441		int base = (long)config->ibbase;
   442		char *device_path;
   443		int match;
   444		struct usb_device *udev;
   445	
   446		DIA_LOG(0, "Board %p -t %s -m %d -a %p -u %d -l %d -b %d\n",
   447			board, board->interface->name, board->minor, config->device_path,
   448			config->pci_bus, config->pci_slot, base);
   449	
   450		board->private_data = NULL;  /* to be sure - we can detach before setting */
   451	
   452		/* identify device to be attached */
   453	
   454		mutex_lock(&minors_lock);
   455	
   456		if (config->device_path) {
   457			/* if config->device_path given, try that first */
   458			pr_alert("%s:%s - Looking for device_path: %s\n",
   459				 NAME, __func__, config->device_path);
   460			for (j = 0 ; j < MAX_DEV ; j++) {
   461				if ((assigned_usb_minors & 1 << j) == 0)
   462					continue;
   463				udev =	usb_get_dev(interface_to_usbdev(lpvo_usb_interfaces[j]));
   464				device_path = kobject_get_path(&udev->dev.kobj, GFP_KERNEL);
   465				match = gpib_match_device_path(&lpvo_usb_interfaces[j]->dev,
   466							       config->device_path);
   467				DIA_LOG(1, "dev. %d: minor %d  path: %s --> %d\n", j,
   468					lpvo_usb_interfaces[j]->minor, device_path, match);
   469				kfree(device_path);
   470				if (match)
   471					break;
   472			}
   473		} else if (config->pci_bus != -1 && config->pci_slot != -1) {
   474			/* second: look for bus and slot */
   475			for (j = 0 ; j < MAX_DEV ; j++) {
   476				if ((assigned_usb_minors & 1 << j) == 0)
   477					continue;
   478				udev =	usb_get_dev(interface_to_usbdev(lpvo_usb_interfaces[j]));
   479				DIA_LOG(1, "dev. %d: bus %d -> %d  dev: %d -> %d\n", j,
   480					udev->bus->busnum, config->pci_bus, udev->devnum, config->pci_slot);
   481				if (config->pci_bus == udev->bus->busnum &&
   482				    config->pci_slot == udev->devnum)
   483					break;
   484			}
   485		} else {		/* last chance: usb_minor, given as ibbase */
   486			for (j = 0 ; j < MAX_DEV ; j++) {
   487				if (usb_minors[j] == base && assigned_usb_minors & 1 << j)
   488					break;
   489			}
   490		}
   491		mutex_unlock(&minors_lock);
   492	
   493		if (j == MAX_DEV) {
   494			pr_alert("%s:%s - Requested device is not registered.\n", NAME, __func__);
   495			return -EIO;
   496		}
   497	
   498		board->private_data = kzalloc(sizeof(struct usb_gpib_priv), GFP_KERNEL);
   499		if (!board->private_data)
   500			return -ENOMEM;
   501	
   502		retval = skel_do_open(board, usb_minors[j]);
   503	
   504		DIA_LOG(1, "Skel open: %d\n", retval);
   505	
   506		if (retval) {
   507			TTY_LOG("%s:%s - skel open failed.\n", NAME, __func__);
   508			kfree(board->private_data);
   509			board->private_data = NULL;
   510			return -ENODEV;
   511		}
   512	
   513		SHOW_STATUS(board);
   514	
   515		retval = send_command(board, USB_GPIB_ON, 0);
   516		DIA_LOG(1, "USB_GPIB_ON returns %x\n", retval);
   517		if (retval != ACK)
   518			return -EIO;
   519	
   520		/* We must setup debug mode because we need the extended instruction
   521		 * set to cope with the Core (gpib_common) point of view
   522		 */
   523	
   524		retval = send_command(board, USB_GPIB_DEBUG_ON, 0);
   525		DIA_LOG(1, "USB_GPIB_DEBUG_ON returns %x\n", retval);
   526		if (retval != ACK)
   527			return -EIO;
   528	
   529		/* We must keep REN off after an IFC because so it is
   530		 * assumed by the Core
   531		 */
   532	
   533		retval = send_command(board, USB_GPIB_IBm0, 0);
   534		DIA_LOG(1, "USB_GPIB_IBm0 returns %x\n", retval);
   535		if (retval != ACK)
   536			return -EIO;
   537	
   538		retval = set_control_line(board, IB_BUS_REN, 0);
   539		if (retval != ACK)
   540			return -EIO;
   541	
   542		retval = send_command(board, USB_GPIB_FTMO, 0);
   543		DIA_LOG(1, "USB_GPIB_FTMO returns %x\n", retval);
   544		if (retval != ACK)
   545			return -EIO;
   546	
   547		SHOW_STATUS(board);
   548		TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
   549		return 0;
   550	}
   551	
   552	/**
   553	 * usb_gpib_detach() - deactivate the usb-gpib converter board
   554	 *
   555	 * @board:    the gpib_board data area for this gpib interface
   556	 *
   557	 */
   558	
   559	static void usb_gpib_detach(gpib_board_t *board)
   560	{
   561		int retval;
   562	
   563		SHOW_STATUS(board);
   564	
   565		DIA_LOG(0, "detaching %p\n", board);
   566	
   567		if (board->private_data) {
   568			if (GPIB_DEV) {
   569				write_loop(GPIB_DEV, USB_GPIB_OFF, strlen(USB_GPIB_OFF));
   570				msleep(100);
   571				DIA_LOG(1, "%s", "GPIB off\n");
   572				retval = skel_do_release(board);
   573				DIA_LOG(1, "skel release -> %d\n", retval);
   574			}
   575			kfree(board->private_data);
   576			board->private_data = NULL;
   577		}
   578	
   579		DIA_LOG(0, "done %p\n", board);
   580		TTY_LOG("Module '%s' has been detached\n", NAME);
   581	}
   582	
   583	/*
   584	 *   Other functions follow in alphabetical order
   585	 */
   586	/* command */
   587	static int usb_gpib_command(gpib_board_t *board,
   588				    u8 *buffer,
   589				    size_t length,
   590				    size_t *bytes_written)
   591	{
   592		int i, retval;
   593		char command[6] = "IBc\n";
   594	
   595		DIA_LOG(1, "enter %p\n", board);
   596	
   597		set_timeout(board);
   598	
   599		for (i = 0 ; i < length ; i++) {
   600			command[3] = buffer[i];
   601			retval = send_command(board, command, 5);
   602			DIA_LOG(2, "%d ==> %x %x\n", i, buffer[i], retval);
   603			if (retval != 0x06)
   604				return retval;
   605			++(*bytes_written);
   606		}
   607		return 0;
   608	}
   609	
   610	/**
   611	 * disable_eos() - Disable END on eos byte (END on EOI only)
   612	 *
   613	 * @board:    the gpib_board data area for this gpib interface
   614	 *
   615	 *   With the lpvo adapter eos can only be handled via software.
   616	 *   Cannot do nothing here, but remember for future use.
   617	 */
   618	
   619	static void usb_gpib_disable_eos(gpib_board_t *board)
   620	{
   621		((struct usb_gpib_priv *)board->private_data)->eos_flags &= ~REOS;
   622		DIA_LOG(1, "done: %x\n",
   623			((struct usb_gpib_priv *)board->private_data)->eos_flags);
   624	}
   625	
   626	/**
   627	 * enable_eos() - Enable END for reads when eos byte is received.
   628	 *
   629	 * @board:    the gpib_board data area for this gpib interface
   630	 * @eos_byte: the 'eos' byte
   631	 * @compare_8_bits: if zero ignore eigthth bit when comparing
   632	 *
   633	 */
   634	
   635	static int usb_gpib_enable_eos(gpib_board_t *board,
   636				       u8 eos_byte,
   637				       int compare_8_bits)
   638	{
   639		struct usb_gpib_priv *pd = (struct usb_gpib_priv *)board->private_data;
   640	
   641		DIA_LOG(1, "enter with %x\n", eos_byte);
   642		pd->eos = eos_byte;
   643		pd->eos_flags = REOS;
   644		if (compare_8_bits)
   645			pd->eos_flags |= BIN;
   646		return 0;
   647	}
   648	
   649	/**
   650	 * go_to_standby() - De-assert ATN
   651	 *
   652	 * @board:    the gpib_board data area for this gpib interface
   653	 */
   654	
   655	static int usb_gpib_go_to_standby(gpib_board_t *board)
   656	{
   657		int retval = set_control_line(board, IB_BUS_ATN, 0);
   658	
   659		DIA_LOG(1, "done with %x\n", retval);
   660	
   661		if (retval == ACK)
   662			return 0;
   663		return -EIO;
   664	}
   665	
   666	/**
   667	 * interface_clear() - Assert or de-assert IFC
   668	 *
   669	 * @board:    the gpib_board data area for this gpib interface
   670	 * assert:    1: assert IFC;  0: de-assert IFC
   671	 *
   672	 *    Currently on the assert request we issue the lpvo IBZ
   673	 *    command that cycles IFC low for 100 usec, then we ignore
   674	 *    the de-assert request.
   675	 */
   676	
   677	static void usb_gpib_interface_clear(gpib_board_t *board, int assert)
   678	{
   679		int retval = 0;
   680	
   681		DIA_LOG(1, "enter with %d\n", assert);
   682	
   683		if (assert) {
   684			retval = send_command(board, USB_GPIB_IBCL, 0);
   685	
   686			set_bit(CIC_NUM, &board->status);
   687		}
   688	
   689		DIA_LOG(1, "done with %d %d\n", assert, retval);
   690	}
   691	
   692	/**
   693	 * line_status() - Read the status of the bus lines.
   694	 *
   695	 *  @board:    the gpib_board data area for this gpib interface
   696	 *
   697	 *    We can read all lines.
   698	 */
   699	
   700	#define WQT wait_queue_entry_t
   701	#define WQH head
   702	#define WQE entry
   703	
   704	static int usb_gpib_line_status(const gpib_board_t *board)
   705	{
   706		int buffer;
   707		int line_status = ValidALL;   /* all lines will be read */
   708		struct list_head *p, *q;
   709		WQT *item;
   710		unsigned long flags;
   711		int sleep = 0;
   712	
   713		DIA_LOG(1, "%s\n", "request");
   714	
   715		/* if we are on the wait queue (board->wait), do not hurry
   716		 * reading status line; instead, pause a little
   717		 */
   718	
   719		spin_lock_irqsave((spinlock_t *)&board->wait.lock, flags);
   720		q = (struct list_head *)&board->wait.WQH;
   721		list_for_each(p, q) {
   722			item = container_of(p, WQT, WQE);
   723			if (item->private == current) {
   724				sleep = 20;
   725				break;
   726			}
   727			/* pid is: ((struct task_struct *) item->private)->pid); */
   728		}
   729		spin_unlock_irqrestore((spinlock_t *)&board->wait.lock, flags);
   730		if (sleep) {
   731			DIA_LOG(1, "we are on the wait queue - sleep %d ms\n", sleep);
   732			msleep(sleep);
   733		}
   734	
   735		buffer = send_command((gpib_board_t *)board, USB_GPIB_STATUS, 0);
   736	
   737		if (buffer < 0) {
   738			pr_alert("%s:%s - line status read failed with %d\n", NAME, __func__, buffer);
   739			return -1;
   740		}
   741	
   742		if ((buffer & 0x01) == 0)
   743			line_status |= BusREN;
   744		if ((buffer & 0x02) == 0)
   745			line_status |= BusIFC;
   746		if ((buffer & 0x04) == 0)
   747			line_status |= BusNDAC;
   748		if ((buffer & 0x08) == 0)
   749			line_status |= BusNRFD;
   750		if ((buffer & 0x10) == 0)
   751			line_status |= BusDAV;
   752		if ((buffer & 0x20) == 0)
   753			line_status |= BusEOI;
   754		if ((buffer & 0x40) == 0)
   755			line_status |= BusATN;
   756		if ((buffer & 0x80) == 0)
   757			line_status |= BusSRQ;
   758	
   759		DIA_LOG(1, "done with %x %x\n", buffer, line_status);
   760	
   761		return line_status;
   762	}
   763	
   764	/* parallel_poll */
   765	
   766	static int usb_gpib_parallel_poll(gpib_board_t *board, uint8_t *result)
   767	{
   768		/* request parallel poll asserting ATN | EOI;
   769		 * we suppose ATN already asserted
   770		 */
   771	
   772		int retval;
   773	
   774		DIA_LOG(1, "enter %p\n", board);
   775	
   776		retval = set_control_line(board, IB_BUS_EOI, 1);
   777		if (retval != ACK) {
   778			pr_alert("%s:%s - assert EOI failed\n", NAME, __func__);
   779			return -EIO;
   780		}
   781	
   782		*result = send_command(board, USB_GPIB_READ_DATA, 0);
   783	
   784		DIA_LOG(1, "done with %x\n", *result);
   785	
   786		retval = set_control_line(board, IB_BUS_EOI, 0);
   787		if (retval != 0x06) {
   788			pr_alert("%s:%s - unassert EOI failed\n", NAME, __func__);
   789			return -EIO;
   790		}
   791	
   792		return 0;
   793	}
   794	
   795	/* read */
   796	
   797	static int usb_gpib_read(gpib_board_t *board,
   798				 u8 *buffer,
   799				 size_t length,
   800				 int *end,
   801				 size_t *bytes_read)
   802	{
   803	#define MAX_READ_EXCESS 16384
   804	
   805		struct char_buf b = {NULL, 0};
   806	
   807		int retval;
   808		char c, nc;
   809		int ic;
   810		struct timespec64 before, after;
   811		int read_count = MAX_READ_EXCESS;
   812		struct usb_gpib_priv *pd = (struct usb_gpib_priv *)board->private_data;
   813	
   814		DIA_LOG(1, "enter %p -> %zu\n", board, length);
   815	
   816		*bytes_read = 0;      /* by default, things go wrong */
   817		*end = 0;
   818	
   819		set_timeout(board);
   820	
   821		/* single byte read has a special handling */
   822	
   823		if (length == 1) {
   824			char inbuf[2] = {0, 0};
   825	
   826			/* read a single character */
   827	
   828			ktime_get_real_ts64 (&before);
   829	
   830			retval = write_loop(GPIB_DEV, USB_GPIB_READ_1, strlen(USB_GPIB_READ_1));
   831			if (retval < 0)
   832				return retval;
   833	
   834			retval = skel_do_read(GPIB_DEV, inbuf, 1);
   835			retval += skel_do_read(GPIB_DEV, inbuf + 1, 1);
   836	
   837			ktime_get_real_ts64 (&after);
   838	
   839			DIA_LOG(1, "single read: %x %x %x in %d\n", retval,
   840				inbuf[0], inbuf[1],
   841				usec_diff(&after, &before));
   842	
   843			/* good char / last char? */
   844	
   845			if (retval == 2 && inbuf[1] == ACK) {
   846				buffer[0] = inbuf[0];
   847				*bytes_read = 1;
   848				return 0;
   849			}
   850			if (retval < 2)
   851				return -EIO;
   852			else
   853				return -ETIME;
   854			return 0;
   855		}
   856	
   857		/* allocate buffer for multibyte read */
   858	
   859		b.inbuf = kmalloc(INBUF_SIZE, GFP_KERNEL);
   860		if (!b.inbuf)
   861			return -ENOMEM;
   862	
   863		/* send read command and check <DLE><STX> sequence */
   864	
   865		retval = write_loop(GPIB_DEV, USB_GPIB_READ, strlen(USB_GPIB_READ));
   866		if (retval < 0)
   867			goto read_return;
   868	
   869		if (one_char(board, &b) != DLE || one_char(board, &b) != STX) {
   870			pr_alert("%s:%s - wrong <DLE><STX> sequence\n",
   871				 NAME, __func__);
   872			retval = -EIO;
   873			goto read_return;
   874		}
   875	
   876		/* get data flow */
   877	
   878		while (1) {
   879			ic = one_char(board, &b);
   880			if (ic == -EIO) {
   881				retval = -EIO;
   882				goto read_return;
   883			}
   884			c = ic;
   885	
   886			if (c == DLE)
   887				nc = one_char(board, &b);
   888			if (c != DLE || nc == DLE) {
   889				/* data byte - store into buffer */
   890	
   891				if (*bytes_read == length)
   892					break; /* data overflow */
   893				if (c == DLE)
   894					c = nc;
   895				buffer[(*bytes_read)++] = c;
   896				if (c == pd->eos) {
   897					*end = 1;
   898					break;
   899				}
   900	
   901			} else {
   902				/* we are in the closing <DLE><ETX> sequence */
   903	
   904				if (c == ETX) {
   905					c = one_char(board, &b);
   906					if (c == ACK) {
   907						*end = 1;
   908						retval = 0;
   909						goto read_return;
   910					} else {
   911						pr_alert("%s:%s - %s %x\n",
   912							 NAME, __func__,
   913							 "Wrong end of message", c);
   914						retval = -ETIME;
   915						goto read_return;
   916					}
   917				} else {
   918					pr_alert("%s:%s - %s\n", NAME, __func__,
   919						 "lone <DLE> in stream");
   920					retval = -EIO;
   921					goto read_return;
   922				}
   923			}
   924		}
   925	
   926		/* we had a data overflow - flush excess data */
   927	
   928		while (read_count--) {
   929			if (one_char(board, &b) != DLE)
   930				continue;
   931			c = one_char(board, &b);
   932			if (c == DLE)
   933				continue;
   934			if (c == ETX) {
   935				c = one_char(board, &b);
   936				if (c == ACK) {
   937					if (MAX_READ_EXCESS - read_count > 1)
   938						pr_alert("%s:%s - %s\n", NAME, __func__,
   939							 "small buffer - maybe some data lost");
   940					retval = 0;
   941					goto read_return;
   942				}
   943				break;
   944			}
   945		}
   946	
   947		pr_alert("%s:%s - no input end - GPIB board in odd state\n",
   948			 NAME, __func__);
   949		retval = -EIO;
   950	
   951	read_return:
   952		kfree(b.inbuf);
   953	
   954		DIA_LOG(1, "done with byte/status: %d %x %d\n",
   955			(int)*bytes_read, retval, *end);
   956	
   957		if (retval == 0 || retval == -ETIME) {
   958			if (send_command(board, USB_GPIB_UNTALK, sizeof(USB_GPIB_UNTALK)) == 0x06)
   959				return retval;
   960			return	-EIO;
   961		}
   962	
   963		return retval;
   964	}
   965	
   966	/* remote_enable */
   967	
   968	static void usb_gpib_remote_enable(gpib_board_t *board, int enable)
   969	{
   970		int retval;
   971	
   972		retval = set_control_line(board, IB_BUS_REN, enable ? 1 : 0);
   973		if (retval != ACK)
   974			pr_alert("%s:%s - could not set REN line: %x\n",
   975				 NAME, __func__, retval);
   976	
   977		DIA_LOG(1, "done with %x\n", retval);
   978	}
   979	
   980	/* request_system_control */
   981	
   982	static void usb_gpib_request_system_control(gpib_board_t *board,
   983						    int request_control)
   984	{
   985		if (request_control)
   986			set_bit(CIC_NUM, &board->status);
   987		else
   988			clear_bit(CIC_NUM, &board->status);
   989	
   990		DIA_LOG(1, "done with %d -> %lx\n", request_control, board->status);
   991	}
   992	
   993	/* take_control */
   994	/* beware: the sync flag is ignored; what is its real meaning? */
   995	
   996	static int usb_gpib_take_control(gpib_board_t *board, int sync)
   997	{
   998		int retval;
   999	
  1000		retval = set_control_line(board, IB_BUS_ATN, 1);
  1001	
  1002		DIA_LOG(1, "done with %d %x\n", sync, retval);
  1003	
  1004		if (retval == ACK)
  1005			return 0;
  1006		return -EIO;
  1007	}
  1008	
  1009	/* update_status */
  1010	
  1011	static unsigned int usb_gpib_update_status(gpib_board_t *board,
  1012						   unsigned int clear_mask)
  1013	{
  1014		/* There is nothing we can do here, I guess */
  1015	
  1016		board->status &= ~clear_mask;
  1017	
  1018		DIA_LOG(1, "done with %x %lx\n", clear_mask, board->status);
  1019	
  1020		return board->status;
  1021	}
  1022	
  1023	/* write */
  1024	/* beware: DLE characters are not escaped - can only send ASCII data */
  1025	
  1026	static int usb_gpib_write(gpib_board_t *board,
  1027				  u8 *buffer,
  1028				  size_t length,
  1029				  int send_eoi,
  1030				  size_t *bytes_written)
  1031	{
  1032		int retval;
  1033		char *msg;
  1034	
  1035		DIA_LOG(1, "enter %p -> %zu\n", board, length);
  1036	
  1037		set_timeout(board);
  1038	
  1039		msg = kmalloc(length + 8, GFP_KERNEL);
  1040		if (!msg)
  1041			return -ENOMEM;
  1042	
  1043		memcpy(msg, "\nIB\020\002", 5);
  1044		memcpy(msg + 5, buffer, length);
  1045		memcpy(msg + 5 + length, "\020\003\n", 3);
  1046	
  1047		retval = send_command(board, msg, length + 8);
  1048		kfree(msg);
  1049	
  1050		DIA_LOG(1, "<%.*s> -> %x\n", (int)length, buffer, retval);
  1051	
  1052		if (retval != ACK)
  1053			return -EPIPE;
  1054	
  1055		*bytes_written = length;
  1056	
  1057		if (send_command(board, USB_GPIB_UNLISTEN, sizeof(USB_GPIB_UNLISTEN))
  1058		    != 0x06)
  1059			return  -EPIPE;
  1060	
  1061		return length;
  1062	}
  1063	
  1064	/*
  1065	 *  ***	 following functions not implemented yet  ***
  1066	 */
  1067	
  1068	/* parallel_poll configure */
  1069	
  1070	static void usb_gpib_parallel_poll_configure(gpib_board_t *board,
  1071						     uint8_t configuration)
  1072	{
  1073		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1074	}
  1075	
  1076	/* parallel_poll_response */
  1077	
  1078	static void usb_gpib_parallel_poll_response(gpib_board_t *board, int ist)
  1079	{
  1080		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1081	}
  1082	
  1083	/* primary_address */
  1084	
  1085	static int  usb_gpib_primary_address(gpib_board_t *board, unsigned int address)
  1086	{
  1087		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1088		return 0;
  1089	}
  1090	
  1091	/* return_to_local */
  1092	
  1093	static	void usb_gpib_return_to_local(gpib_board_t *board)
  1094	{
  1095		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1096	}
  1097	
  1098	/* secondary_address */
  1099	
  1100	static int usb_gpib_secondary_address(gpib_board_t *board,
  1101					      unsigned int address,
  1102					      int enable)
  1103	{
  1104		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1105		return 0;
  1106	}
  1107	
  1108	/* serial_poll_response */
  1109	
  1110	static void usb_gpib_serial_poll_response(gpib_board_t *board, uint8_t status)
  1111	{
  1112		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1113	}
  1114	
  1115	/* serial_poll_status */
  1116	
  1117	static uint8_t usb_gpib_serial_poll_status(gpib_board_t *board)
  1118	{
  1119		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1120		return 0;
  1121	}
  1122	
  1123	/* t1_delay */
  1124	
  1125	static unsigned int usb_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec)
  1126	{
  1127		pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
  1128		return 0;
  1129	}
  1130	
  1131	/*
  1132	 *   ***  module dispatch table and init/exit functions	 ***
  1133	 */
  1134	
  1135	gpib_interface_t usb_gpib_interface = {
  1136	name: NAME,
  1137	attach : usb_gpib_attach,
  1138	detach : usb_gpib_detach,
  1139	read : usb_gpib_read,
  1140	write : usb_gpib_write,
  1141	command : usb_gpib_command,
  1142	take_control : usb_gpib_take_control,
  1143	go_to_standby : usb_gpib_go_to_standby,
  1144	request_system_control : usb_gpib_request_system_control,
  1145	interface_clear : usb_gpib_interface_clear,
  1146	remote_enable : usb_gpib_remote_enable,
  1147	enable_eos : usb_gpib_enable_eos,
  1148	disable_eos : usb_gpib_disable_eos,
  1149	parallel_poll : usb_gpib_parallel_poll,
  1150	parallel_poll_configure : usb_gpib_parallel_poll_configure,
  1151	parallel_poll_response : usb_gpib_parallel_poll_response,
  1152	local_parallel_poll_mode : NULL, // XXX
  1153	line_status : usb_gpib_line_status,
  1154	update_status : usb_gpib_update_status,
  1155	primary_address : usb_gpib_primary_address,
  1156	secondary_address : usb_gpib_secondary_address,
  1157	serial_poll_response : usb_gpib_serial_poll_response,
  1158	serial_poll_status : usb_gpib_serial_poll_status,
  1159	t1_delay : usb_gpib_t1_delay,
  1160	return_to_local : usb_gpib_return_to_local,
  1161	skip_check_for_command_acceptors : 1
  1162	};
  1163	
  1164	/*
  1165	 *   usb_gpib_init_module(), usb_gpib_exit_module()
  1166	 *
  1167	 *   This functions are called every time a new device is detected
  1168	 *   and registered or is removed and unregistered.
  1169	 *   We must take note of created and destroyed usb minors to be used
  1170	 *   when usb_gpib_attach() and usb_gpib_detach() will be called on
  1171	 *   request by gpib_config.
  1172	 */
  1173	
  1174	static int usb_gpib_init_module(struct usb_interface *interface)
  1175	{
  1176		int j, mask, rv;
  1177	
  1178		rv = mutex_lock_interruptible(&minors_lock);
  1179		if (rv < 0)
  1180			return rv;
  1181	
  1182		if (!assigned_usb_minors) {
  1183			gpib_register_driver(&usb_gpib_interface, THIS_MODULE);
  1184		} else {
  1185			/* check if minor is already registered - maybe useless, but if
  1186			 *  it happens the code is inconsistent somewhere
  1187			 */
  1188	
  1189			for (j = 0 ; j < MAX_DEV ; j++) {
  1190				if (usb_minors[j] == interface->minor && assigned_usb_minors & 1 << j) {
  1191					pr_alert("%s:%s - CODE BUG: USB minor %d registered at %d.\n",
  1192						 NAME, __func__, interface->minor, j);
  1193					rv = -1;
  1194					goto exit;
  1195				}
  1196			}
  1197		}
  1198	
  1199		/* find a free slot */
  1200	
  1201		for (j = 0 ; j < MAX_DEV ; j++) {
  1202			mask = 1 << j;
  1203			if ((assigned_usb_minors & mask) == 0) {
  1204				usb_minors[j] = interface->minor;
  1205				lpvo_usb_interfaces[j] = interface;
  1206				assigned_usb_minors |= mask;
  1207				DIA_LOG(0, "usb minor %d registered at %d\n", interface->minor, j);
  1208				rv = 0;
  1209				goto exit;
  1210			}
  1211		}
  1212		pr_alert("%s:%s - No slot available for interface %p minor %d\n",
  1213			 NAME, __func__, interface, interface->minor);
  1214		rv = -1;
  1215	
  1216	exit:
  1217		mutex_unlock(&minors_lock);
  1218		return rv;
  1219	}
  1220	
  1221	static void usb_gpib_exit_module(int minor)
  1222	{
  1223		int j;
  1224	
  1225		mutex_lock(&minors_lock);
  1226		for (j = 0 ; j < MAX_DEV ; j++) {
  1227			if (usb_minors[j] == minor && assigned_usb_minors & 1 << j) {
  1228				assigned_usb_minors &= ~(1 << j);
  1229				usb_minors[j] = -1;
  1230				if (assigned_usb_minors == 0)
  1231					gpib_unregister_driver(&usb_gpib_interface);
  1232				goto exit;
  1233			}
  1234		}
  1235		pr_alert("%s:%s - CODE BUG: USB minor %d not found.\n", NAME, __func__, minor);
  1236	
  1237	exit:
  1238		mutex_unlock(&minors_lock);
  1239	}
  1240	
  1241	/*
  1242	 *     Default latency time (16 msec) is too long.
  1243	 *     We must use 1 msec (best); anyhow, no more than 5 msec.
  1244	 *
  1245	 *     Defines and function taken and modified from the kernel tree
  1246	 *     (see ftdi_sio.h and ftdi_sio.c).
  1247	 *
  1248	 */
  1249	
  1250	#define FTDI_SIO_SET_LATENCY_TIMER	9 /* Set the latency timer */
  1251	#define FTDI_SIO_SET_LATENCY_TIMER_REQUEST FTDI_SIO_SET_LATENCY_TIMER
  1252	#define FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE 0x40
  1253	#define WDR_TIMEOUT 5000 /* default urb timeout */
  1254	#define WDR_SHORT_TIMEOUT 1000	/* shorter urb timeout */
  1255	
  1256	#define LATENCY_TIMER 1		   /* use a small latency timer: 1 ... 5 msec */
  1257	#define LATENCY_CHANNEL 0	   /* channel selection in multichannel devices */
  1258	static int write_latency_timer(struct usb_device *udev)
  1259	{
  1260		int rv = usb_control_msg(udev,
  1261					 usb_sndctrlpipe(udev, 0),
  1262					 FTDI_SIO_SET_LATENCY_TIMER_REQUEST,
  1263					 FTDI_SIO_SET_LATENCY_TIMER_REQUEST_TYPE,
  1264					 LATENCY_TIMER, LATENCY_CHANNEL,
  1265					 NULL, 0, WDR_TIMEOUT);
  1266		if (rv < 0)
  1267			pr_alert("Unable to write latency timer: %i\n", rv);
  1268		return rv;
  1269	}
  1270	
  1271	/*****************************************************************************
  1272	 *									     *
  1273	 *  The following code is a modified version of the USB Skeleton driver	     *
  1274	 *  written by Greg Kroah-Hartman and available in the kernel tree.	     *
  1275	 *									     *
  1276	 *  Functions skel_open() and skel_release() have been rewritten and named   *
  1277	 *  skel_do_open() and skel_do_release() to process the attach and detach    *
  1278	 *  requests coming from gpib_config.					     *
  1279	 *									     *
  1280	 *  Functions skel_read() and skel_write() have been split into a	     *
  1281	 *  skel_do_read() and skel_do_write(), that cover the kernel stuff of read  *
  1282	 *  and write operations, and the original skel_read() and skel_write(),     *
  1283	 *  that handle communication with user space and call their _do_ companion. *
  1284	 *									     *
  1285	 *  Only the _do_ versions are used by the lpvo_usb_gpib driver; other ones  *
  1286	 *  can be (optionally) maintained in the compilation to have direct access  *
  1287	 *  to a gpib controller for debug and diagnostics.			     *
  1288	 *									     *
  1289	 *  To avoid collisions in names, devices in user space have been renamed    *
  1290	 *  lpvo_raw1, lpvo_raw2 ....  and the usb driver has been renamed with the  *
  1291	 *  gpib module name.							     *
  1292	 *									     *
  1293	 *****************************************************************************/
  1294	
  1295	/*
  1296	 * USB Skeleton driver - 2.2
  1297	 *
  1298	 * Copyright (C) 2001-2004 Greg Kroah-Hartman (greg@kroah.com)
  1299	 *
  1300	 * This driver is based on the 2.6.3 version of drivers/usb/usb-skeleton.c
  1301	 * but has been rewritten to be easier to read and use.
  1302	 */
  1303	
  1304	#include <linux/errno.h>
  1305	#include <linux/kref.h>
> 1306	#include <linux/uaccess.h>
  1307	#include <linux/mutex.h>
  1308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
