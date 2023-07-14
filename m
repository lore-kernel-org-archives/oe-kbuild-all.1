Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E561373D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689340478; x=1720876478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OuBEuX43D3+5vLaZk0MU4XDH2RLdlL5VzT5zgPnlZbY=;
  b=klNlG6oAhRh0aczFdBE7/gyMherOi5MKgywE0K9BSfTuKEbEWU8Sx6fR
   3s/W9dGumMS6yIXlxybSyw3wvzH9WxfeAyFNmR+bmU4JF2SSiaZ4H9+m7
   2IjrF35yoBW1XjK8efKXa7SkNOEigYy64ksmH1Gd0ZtzY5FLwrv9vvEbg
   IDYvCIMycNp8xHcj3/LWboNgH2Imb0vRDeCC4QcUW6XHWR0FweUQKLYIM
   MrJgAH1ZXSTnvifGZ5WVP2OVOa6+C0wR5DNZPt8dunvSHPBtwTO3Wy9W8
   uZST0CkP7c0yxIUMQS1bJ7sil3395iwyogc8E4wAXXTmC25dwcIbytLak
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365510371"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="365510371"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 06:14:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="896413534"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="896413534"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 06:14:36 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKId1-0007Sj-0e;
	Fri, 14 Jul 2023 13:14:35 +0000
Date: Fri, 14 Jul 2023 21:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 56/94] drivers/input/serio/serport.c:47:35: error:
 'const struct tty_operations' has no member named 'write'
Message-ID: <202307142149.sffhW16A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   071ae35d4018d22d6addf02ae7014b2004e781f0
commit: e034e751e4b6fe5061c660558b90dc4a2a43305b [56/94] tty: propagate u8 data to tty_operations::write()
config: arc-randconfig-r033-20230714 (https://download.01.org/0day-ci/archive/20230714/202307142149.sffhW16A-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142149.sffhW16A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307142149.sffhW16A-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/input/serio/serport.c: In function 'serport_serio_write':
>> drivers/input/serio/serport.c:47:35: error: 'const struct tty_operations' has no member named 'write'
      47 |         return -(serport->tty->ops->write(serport->tty, &data, 1) != 1);
         |                                   ^~
   drivers/input/serio/serport.c:48:1: error: control reaches end of non-void function [-Werror=return-type]
      48 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/tty/tty_io.c: In function 'tty_write_message':
>> drivers/tty/tty_io.c:1070:29: error: 'const struct tty_operations' has no member named 'write'
    1070 |                 if (tty->ops->write && tty->count > 0)
         |                             ^~
   drivers/tty/tty_io.c:1071:33: error: 'const struct tty_operations' has no member named 'write'
    1071 |                         tty->ops->write(tty, msg, strlen(msg));
         |                                 ^~
   drivers/tty/tty_io.c: In function 'file_tty_write':
   drivers/tty/tty_io.c:1085:30: error: 'const struct tty_operations' has no member named 'write'
    1085 |         if (!tty || !tty->ops->write || tty_io_error(tty))
         |                              ^~
   drivers/tty/tty_io.c: In function 'tty_send_xchar':
   drivers/tty/tty_io.c:1169:17: error: 'const struct tty_operations' has no member named 'write'
    1169 |         tty->ops->write(tty, &ch, 1);
         |                 ^~
   drivers/tty/tty_io.c: In function 'tty_put_char':
   drivers/tty/tty_io.c:3149:24: error: 'const struct tty_operations' has no member named 'write'
    3149 |         return tty->ops->write(tty, &ch, 1);
         |                        ^~
   drivers/tty/tty_io.c:3150:1: error: control reaches end of non-void function [-Werror=return-type]
    3150 | }
         | ^
   cc1: some warnings being treated as errors
--
   drivers/tty/n_tty.c: In function 'do_output_char':
>> drivers/tty/n_tty.c:437:33: error: 'const struct tty_operations' has no member named 'write'
     437 |                         tty->ops->write(tty, "\r\n", 2);
         |                                 ^~
   drivers/tty/n_tty.c:459:33: error: 'const struct tty_operations' has no member named 'write'
     459 |                         tty->ops->write(tty, "        ", spaces);
         |                                 ^~
   drivers/tty/n_tty.c: In function 'process_output_block':
   drivers/tty/n_tty.c:583:21: error: 'const struct tty_operations' has no member named 'write'
     583 |         i = tty->ops->write(tty, buf, i);
         |                     ^~
   drivers/tty/n_tty.c: In function 'n_tty_write':
   drivers/tty/n_tty.c:2389:45: error: 'const struct tty_operations' has no member named 'write'
    2389 |                                 c = tty->ops->write(tty, b, nr);
         |                                             ^~
   drivers/tty/n_tty.c: In function 'n_tty_poll':
   drivers/tty/n_tty.c:2455:21: error: 'const struct tty_operations' has no member named 'write'
    2455 |         if (tty->ops->write && !tty_is_writelocked(tty) &&
         |                     ^~
--
   drivers/tty/n_hdlc.c: In function 'n_hdlc_send_frames':
>> drivers/tty/n_hdlc.c:288:34: error: 'const struct tty_operations' has no member named 'write'
     288 |                 actual = tty->ops->write(tty, tbuf->buf, tbuf->count);
         |                                  ^~


vim +47 drivers/input/serio/serport.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  39  
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  41   * Callback functions from the serio code.
^1da177e4c3f41 Linus Torvalds 2005-04-16  42   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  static int serport_serio_write(struct serio *serio, unsigned char data)
^1da177e4c3f41 Linus Torvalds 2005-04-16  45  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  46  	struct serport *serport = serio->port_data;
f34d7a5b7010b8 Alan Cox       2008-04-30 @47  	return -(serport->tty->ops->write(serport->tty, &data, 1) != 1);
^1da177e4c3f41 Linus Torvalds 2005-04-16  48  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  49  

:::::: The code at line 47 was first introduced by commit
:::::: f34d7a5b7010b82fe97da95496b9971435530062 tty: The big operations rework

:::::: TO: Alan Cox <alan@lxorguk.ukuu.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
