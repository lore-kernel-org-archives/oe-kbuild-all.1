Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCE23C0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jan 2023 06:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673244331; x=1704780331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IcTlMbqrMAndhBjPoKt+udBhFXiDZfqcLJOM4o1Y6R8=;
  b=WTLQAOLbR199RffjkW9JGd8pz9zDHbXwwfQ7LyyndQ2UwbWqIp7IVawq
   7XVQzygwWWC0U5KMhFp3mnfcvvBOJnZ5uvw21PmgHygb1UBTh6JJ13FrR
   Jla06Pg5b54y8moHtWCQgRYgJpT1ND0bwfluKR2q5dWhdV+i4eOvj9gCf
   R74fGYQJ3MkUy2Z9Kvr/weBFkfcC6qCuiKWTG7npMbFSy2CvoUOjVp7OY
   kQA10xgsrmd9ioCk9RvJZ7Cf0DNrHNliYtw/BGUPY5NgS9mYQGLyh/jGQ
   c6/XHPVqy7aHy/dJgUq3A1XHD/8gGsIjYhW3yUGsRizcKr33HWmwr/Hjj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="322874793"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="322874793"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 22:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="725050803"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="725050803"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jan 2023 22:05:29 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pElHk-0006LS-21;
	Mon, 09 Jan 2023 06:05:28 +0000
Date: Mon, 09 Jan 2023 14:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+78 bytes kernel size regression] [i386-tinyconfig]
 [2ad9bd8332] iov: add import_ubuf()
Message-ID: <63bbae95.zavremmoBoZgkJuv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +78 bytes kernel size regression due to commit:

commit: 2ad9bd8332ac1bc072cc7d785e7cb09d6ad36f4c (iov: add import_ubuf())
https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next


Details as below (size data is obtained by `nm --size-sort vmlinux`):

b7bfaa76: Linux 6.2-rc3
2ad9bd83: iov: add import_ubuf()

+-------------------+----------+----------+-------+
|      symbol       | b7bfaa76 | 2ad9bd83 | delta |
+-------------------+----------+----------+-------+
| nm.T.import_ubuf  | 0        | 77       | 77    |
| bzImage           | 495904   | 495968   | 64    |
| nm.D.linux_banner | 153      | 154      | 1     |
+-------------------+----------+----------+-------+



Thanks

