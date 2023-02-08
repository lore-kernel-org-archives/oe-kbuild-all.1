Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C537B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 02:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675823206; x=1707359206;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3x7uSzC4CDKmwnSD23oNR+JAtTnvTVeeqvk4Or4ncGA=;
  b=hx9L3Nx02ePBPP8pgd/8pKDOFMYxg5mLo3dka4d3vwmFrsUrgsdRX/Pe
   +qb+vjBZgzZKapW+fII9T+Gvq7SxsdN0WdqCipzYcYJRGf9HAOnsMDusL
   0dhCfPvXaQQMgxIgHg90Cf5jfho18CZFCj/FZIYYxC6xezONWjblEE7Uk
   IFvAIc1ea3OsbkxcA6JSoVZdcOqDXofTDr66WNL18WKGOoKpnPjUwv6fy
   wHFsKRFzmmRyljHVta/Z8EwdgpbwuA3XqCvojE+/lisCeJHawg+WpzHsQ
   cj71oL+3rAwj+1B3IOM3IiXIIAreSPVHyY8PHS4TSwBWxaky0qn68jcnX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="310037097"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="310037097"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 18:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="735763480"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="735763480"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2023 18:26:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPaAW-00044s-2Y;
	Wed, 08 Feb 2023 02:26:44 +0000
Date: Wed, 8 Feb 2023 10:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: coolqyj@163.com
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [PATCH V2] mm/filemap: fix page end in
 filemap_get_read_batch
Message-ID: <Y+MIPHQJFiZ+uEu/@a5b9dd7d9a79>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208022400.28962-1-coolqyj@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] [PATCH V2] mm/filemap: fix page end in filemap_get_read_batch
Link: https://lore.kernel.org/stable/20230208022400.28962-1-coolqyj%40163.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



