Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCFE370
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 04:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678250572; x=1709786572;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DG4DbqnTlFZy6fHx8AvbXyEH8H6z0lYyPAiV3FYivJQ=;
  b=Wiz5taNeZfXt4FWzHncB2+iDZexjsZfUxfjrMJlkkbVPSHLc4/NLkzTS
   oY+SPX8HEiwvrSVkfJLHei91Wv5RmM+K/S/6Ai328DQ5ad61wi9qlTWyf
   hbjJg2OFqx1BOX/y4Pw7UeaFhPsnk5fTvBjtcxBe5qQuBggdM9rdfxb14
   m7lwQ4RklrMr8OiAsoqZCLEAoGk9Zd/4x+xxtrx4iZsCVD/7RqLRXwa7E
   4OHJ3Mr4/hYy967eRFX3lBWAEksM7K6+5r19l8H+8GThuVqHPumoQpSJX
   hfgoOMI0jor9sDvJwYKGlJDzHdp199X5NdIHqjCYVPokHo+HloOypzzlm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334772123"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="334772123"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 20:42:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765880830"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="765880830"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2023 20:42:36 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZldL-0001sd-0r;
	Wed, 08 Mar 2023 04:42:35 +0000
Date: Wed, 08 Mar 2023 12:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+181 bytes kernel size regression] [i386-tinyconfig]
 [bcadd8d660] pipe: enable handling of IOCB_NOWAIT
Message-ID: <64081212.767EysP9UnmcbXdl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +181 bytes kernel size regression due to commit:

commit: bcadd8d660058ce3085f58794a0f1bffbf850c25 (pipe: enable handling of IOCB_NOWAIT)
https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git pipe-nonblock


Details as below (size data is obtained by `nm --size-sort vmlinux`):

2eb9ce5f: fs: add 'nonblock' parameter to pipe_buf_confirm() and fops method
bcadd8d6: pipe: enable handling of IOCB_NOWAIT

+-----------------------+----------+----------+-------+
|        symbol         | 2eb9ce5f | bcadd8d6 | delta |
+-----------------------+----------+----------+-------+
| nm.t.pipe_write       | 964      | 1061     | 97    |
| bzImage               | 501600   | 501696   | 96    |
| nm.t.pipe_read        | 612      | 672      | 60    |
| nm.t.__pipe_trylock   | 0        | 23       | 23    |
| nm.t.pipe_buf_confirm | 20       | 21       | 1     |
+-----------------------+----------+----------+-------+



Thanks

