Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457727E6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Nov 2022 01:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668992542; x=1700528542;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tvfDv+7CWSD4OhaAsXXib4PcN2d9j7S5hmueVA0Lm/4=;
  b=Ljo9IFoYJ9osqCn3DXsSERIIchNYH1qKYn7QlxPTdGjQQHUC0oQWS3fH
   whwDcZNe/8hplkO8GyXDpZh52I740B0h5m5o9jsYyxuP19Bx9fOfFQ3ha
   uVXfcsviKi7B906D3xKx5+Xn6OPq+eNvEX2nTQgd2vZlcuf3By9pPiKrj
   Eh0LriA5g2mUmJWLN9P2G5l/Ii5/OMh/7v7r5Xu3/UUaIslT/v+t+mtln
   QURZwRAlL0ZEWimFWM/43uOXTxpClPZ37LobSNI/QrNQYnaCI6s8WD5dQ
   55XdcAYx/hkQf96V0x63dRQAjj4Rm7mgFC3Bk19xJBukBSZT6BR3C6Mok
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="315267444"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="315267444"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2022 17:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="746704196"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="746704196"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2022 17:02:20 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1owvCV-0003Jp-2w;
	Mon, 21 Nov 2022 01:02:19 +0000
Date: Mon, 21 Nov 2022 09:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+187 bytes kernel size regression] [i386-tinyconfig]
 [02f7b9fde6] [REWRITE ME!!!] xattr: use rbtree for simple_xattrs
Message-ID: <637ace05.0BXdrY5qcElSrYPQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +187 bytes kernel size regression due to commit:

commit: 02f7b9fde6162888dbdf9ff5aea27f94eadd77df ([REWRITE ME!!!] xattr: use rbtree for simple_xattrs)
https://github.com/ammarfaizi2/linux-block brauner/linux/fs.xattr.simple.rework.rwlock


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9abf2313: Linux 6.1-rc1
02f7b9fd: [REWRITE ME!!!] xattr: use rbtree for simple_xattrs

+------------------------------+----------+----------+-------+
|            symbol            | 9abf2313 | 02f7b9fd | delta |
+------------------------------+----------+----------+-------+
| nm.T.simple_xattr_add        | 0        | 72       | 72    |
| bzImage                      | 491520   | 491584   | 64    |
| nm.T.simple_xattrs_free      | 0        | 49       | 49    |
| nm.T.simple_xattr_set        | 256      | 288      | 32    |
| nm.t.free_simple_xattr       | 0        | 23       | 23    |
| nm.t.rbtree_simple_xattr_cmp | 0        | 12       | 12    |
| nm.T.simple_xattrs_init      | 0        | 7        | 7     |
| nm.T.simple_xattr_get        | 75       | 78       | 3     |
| nm.D.linux_banner            | 152      | 155      | 3     |
| nm.T.simple_xattr_list       | 94       | 93       | -1    |
| nm.T.simple_xattr_list_add   | 13       | 0        | -13   |
+------------------------------+----------+----------+-------+



Thanks

