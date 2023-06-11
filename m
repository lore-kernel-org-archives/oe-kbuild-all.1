Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FBA15BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 11:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686483784; x=1718019784;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=E5tnMPR4ssl0yl4TxLO20zos4fGwPMgMcFCqzhrnMD8=;
  b=c0ctBK2cIJ6JuMterobUrj5Vqmie3vUyj3YojLbKUUYjoBMzrupaFCtP
   bhsSwhmIPj8R21NGL/DAt6ryLroL+z02/11+DVN7DYTckqCKaxo3+zR6N
   XuARMdMFuyOX2GFawn/U2kzh5Lbr06iTbr0AtSP86CKQZm3XUZuTL3RLF
   J+t3KERTxHRvWrj5EwKEhyOb1vvypBpEGtpaDxV90NjrIwoJe4p1fAc7V
   1XhSFvAMAzkTKjDDPNy31yGd6k4TGbZpqpMOPTKlGcQSmj+K68s7CWazr
   oIKv3xfcaEhERSwjXWEoBAkRarI1q6rdCkcc0aN0fMlu8FSSVoa3+rIT4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="356738508"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="356738508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 04:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="800717759"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="800717759"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jun 2023 04:43:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8JTJ-000Aq4-1v;
	Sun, 11 Jun 2023 11:43:01 +0000
Date: Sun, 11 Jun 2023 19:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Nils Kruse <nilskruse97@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nvme-pci: Add quirk for Samsung PM9B1 256G and 512G SSD
Message-ID: <ZIWzQpH8poJc9nL9@eeaf1f6db856>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b99a5149-c3d6-2a9b-1298-576a1b4b22c1@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] nvme-pci: Add quirk for Samsung PM9B1 256G and 512G SSD
Link: https://lore.kernel.org/stable/b99a5149-c3d6-2a9b-1298-576a1b4b22c1%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



