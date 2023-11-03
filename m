Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA791C2AD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiOBebls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699025945; x=1730561945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=54YJr7nXOwXQ5K2n8H/UELvxwp6Tdq70CrRgfh9+HHw=;
  b=MiOBeblsLtysLEJTCtHui6o5pSgdvnU7CvjW0ZY4S6DJU8C35c0Gr87e
   R3Qro/osIurToqbC1yVf+90pkTSxbvKRu67DnlYwidU19e0gG6GdWVgp5
   ZBmoVE5vHlP60IQ37El3orYAF6cUzrsi+NCrU7YjB4mMsk2eeGv+/l3O4
   tTxuVL9sv6lW0ZjyJpD57I/o1Ol6AuM5cUl+C/CNEuFQoFtJLFXVWL/vG
   ZBjJ1v3CQ0+5+WqbOkRjLBGQzRy0C46jB8uqKIP7tVAb5xuioOBVoxLbi
   /UOp3O4yi8WQG7Ka4vE9nTOKnUHGkSes/XHhfqtIa6OidAtzwgrxaZHIf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388791114"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="388791114"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 08:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="738107773"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="738107773"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Nov 2023 08:39:00 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qywGA-0002dn-2y;
	Fri, 03 Nov 2023 15:38:58 +0000
Date: Fri, 3 Nov 2023 23:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 15/79] drivers/tty/tty_io.c:1152:5: error:
 conflicting types for 'tty_send_xchar'; have 'int(struct tty_struct *, u8)'
 {aka 'int(struct tty_struct *, unsigned char)'}
Message-ID: <202311032318.2MP4TsV1-lkp@intel.com>
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
head:   0c245952ee3106fad8a2fd3198a8e5c324e90992
commit: 44f1bce172713e922fd4fe273ad8d29e1a3e9321 [15/79] tty: make tty_operations::send_xchar accept u8 char
config: csky-randconfig-001-20231103 (https://download.01.org/0day-ci/archive/20231103/202311032318.2MP4TsV1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032318.2MP4TsV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032318.2MP4TsV1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/tty_io.c:1152:5: error: conflicting types for 'tty_send_xchar'; have 'int(struct tty_struct *, u8)' {aka 'int(struct tty_struct *, unsigned char)'}
    1152 | int tty_send_xchar(struct tty_struct *tty, u8 ch)
         |     ^~~~~~~~~~~~~~
   In file included from drivers/tty/tty_io.c:76:
   include/linux/tty.h:413:5: note: previous declaration of 'tty_send_xchar' with type 'int(struct tty_struct *, char)'
     413 | int tty_send_xchar(struct tty_struct *tty, char ch);
         |     ^~~~~~~~~~~~~~


vim +1152 drivers/tty/tty_io.c

  1142	
  1143	/**
  1144	 * tty_send_xchar - send priority character
  1145	 * @tty: the tty to send to
  1146	 * @ch: xchar to send
  1147	 *
  1148	 * Send a high priority character to the tty even if stopped.
  1149	 *
  1150	 * Locking: none for xchar method, write ordering for write method.
  1151	 */
> 1152	int tty_send_xchar(struct tty_struct *tty, u8 ch)
  1153	{
  1154		bool was_stopped = tty->flow.stopped;
  1155	
  1156		if (tty->ops->send_xchar) {
  1157			down_read(&tty->termios_rwsem);
  1158			tty->ops->send_xchar(tty, ch);
  1159			up_read(&tty->termios_rwsem);
  1160			return 0;
  1161		}
  1162	
  1163		if (tty_write_lock(tty, false) < 0)
  1164			return -ERESTARTSYS;
  1165	
  1166		down_read(&tty->termios_rwsem);
  1167		if (was_stopped)
  1168			start_tty(tty);
  1169		tty->ops->write(tty, &ch, 1);
  1170		if (was_stopped)
  1171			stop_tty(tty);
  1172		up_read(&tty->termios_rwsem);
  1173		tty_write_unlock(tty);
  1174		return 0;
  1175	}
  1176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
