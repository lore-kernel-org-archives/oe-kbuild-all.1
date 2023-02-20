Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3582A2F4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676900066; x=1708436066;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+acXqTer/YKClhnAYVzaalQ/xHsoPD6mCsHhH3zBLwA=;
  b=UAwkwp2dKmz6A896GXSeSycrazUIsNBQPfG1i0xSLgcNtUN7eXCQ++GL
   KKLmhT1fgAd6Fchl8JibVtv8mw4QGKOdnFm24zZXkyWAJSpdpWc7DOaGc
   fao9Z3Vcq35vjJ2dS6AVsnLOqUtU7s0oMEfWS5Xj+9ju5+aadcKt3FtiN
   x0NyjP0AyRUNCCUwSQ1ziiYMHXUA9BDWVbd+vK4u1yeatYY14Y/jUnVIH
   n0jGhcG+Ie2RkS0ZlyszKqKjvGnBUj2SMPWwSColnOxzrD8ZsjewvNx1S
   OxyIQHBbsyLiC5CqVNGcHn7hPTxvej4hfHJYYVI7c1GZB3DloFa+T26Ch
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="330114849"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="330114849"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 05:34:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="673364958"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="673364958"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2023 05:34:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU6J7-000Dwn-1i;
	Mon, 20 Feb 2023 13:34:17 +0000
Date: Mon, 20 Feb 2023 21:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+291 bytes kernel size regression] [i386-tinyconfig]
 [71802a803f] printk: Bring back the RT bits.
Message-ID: <63f376c3.8sYrRNQwJT6zRI4i%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +291 bytes kernel size regression due to commit:

commit: 71802a803f3200d6c67fea7c5fc70e0ba51e1058 (printk: Bring back the RT bits.)
https://git.kernel.org/cgit/linux/kernel/git/rt/linux-rt-devel.git linux-6.2.y-rt-rebase


Details as below (size data is obtained by `nm --size-sort vmlinux`):

5379f840: locking/lockdep: Remove lockdep_init_map_crosslock.
71802a80: printk: Bring back the RT bits.

+--------------------------------+----------+----------+-------+
|             symbol             | 5379f840 | 71802a80 | delta |
+--------------------------------+----------+----------+-------+
| bzImage                        | 496032   | 496224   | 192   |
| nm.T.console_unlock            | 64       | 155      | 91    |
| nm.T.console_lock              | 40       | 110      | 70    |
| nm.t.printk_activate_kthreads  | 0        | 35       | 35    |
| nm.T.register_console          | 532      | 561      | 29    |
| nm.t.unregister_console_locked | 105      | 129      | 24    |
| nm.T.is_console_locked         | 6        | 28       | 22    |
| nm.T.console_unblank           | 122      | 131      | 9     |
| nm.t.console_flush_all         | 129      | 135      | 6     |
| nm.b.console_kthreads_active   | 0        | 4        | 4     |
| nm.T.resume_console            | 32       | 35       | 3     |
| nm.B.block_console_kthreads    | 0        | 1        | 1     |
| nm.b.console_kthreads_blocked  | 0        | 1        | 1     |
| nm.b.console_locked            | 4        | 0        | -4    |
+--------------------------------+----------+----------+-------+



Thanks

