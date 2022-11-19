Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E3E20E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Nov 2022 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668861446; x=1700397446;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MHmm+D8ro81E56xJp4FvqYUXanY3Fv40SiojyP1RORo=;
  b=eZxuRYtM7UiavmNE17s4TVmmIgx3C+p4Ff7eEGH2VmaRGG0nGKTU4mdS
   84VHE7/Ktd/88GKg0OsXRnZxFqawQxv+fMGIjj88VEhCMgozSDNOhosnQ
   DmzKlhTW1dBfhQc7z246KtP5XS1EnMOtIu2fgL+cxkYJ3oIP7YSF10mWs
   1D4+wNE5wpzKTdBiAf/P+GadP3YiADnl28Sht7uv4hC2YDySAHDv5X5wK
   eU/RIXgbCQ63X3B6pNZDkGr++bH1sjTToYyfv6NLiqeBcXMG+7K/NyN/8
   5sstwGgZNLMKb0O2KhbJqnPOwD7LmyUskPS8wPDIbUfVHcqA12pyUbmgG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="315133100"
X-IronPort-AV: E=Sophos;i="5.96,176,1665471600"; 
   d="scan'208";a="315133100"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2022 04:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="640522423"
X-IronPort-AV: E=Sophos;i="5.96,176,1665471600"; 
   d="scan'208";a="640522423"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Nov 2022 04:37:25 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1owN64-0002Cf-1Y;
	Sat, 19 Nov 2022 12:37:24 +0000
Date: Sat, 19 Nov 2022 20:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+84 bytes kernel size regression] [i386-tinyconfig]
 [538cb30493] random: add back async readiness notifier
Message-ID: <Y3jOA/oR3QPwv6ni@948c295b3299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116161642.1670235-2-Jason@zx2c4.com>


FYI, we noticed a +84 bytes kernel size regression due to commit:

commit: 538cb30493582ea76f363660fd4bf1c354916854 (random: add back async readiness notifier)
url: https://github.com/intel-lab-lkp/linux/commits/Jason-A-Donenfeld/Use-EFI-variables-for-random-seed/20221117-001923
base: git://git.kernel.org/cgit/linux/kernel/git/crng/random.git master
patch link: https://lore.kernel.org/all/20221116161642.1670235-2-Jason@zx2c4.com/
patch subject: [PATCH RFC v1 1/6] random: add back async readiness notifier


Details as below (size data is obtained by `nm --size-sort vmlinux`):

094226ad: Linux 6.1-rc5
538cb304: random: add back async readiness notifier

+--------------------------------+----------+----------+-------+
|             symbol             | 094226ad | 538cb304 | delta |
+--------------------------------+----------+----------+-------+
| bzImage                        | 491552   | 491616   | 64    |
| nm.T.notify_on_rng_initialized | 0        | 54       | 54    |
| nm.t._credit_init_bits         | 198      | 222      | 24    |
| nm.b.random_ready_chain        | 0        | 4        | 4     |
| nm.D.linux_banner              | 152      | 154      | 2     |
+--------------------------------+----------+----------+-------+



Thanks


