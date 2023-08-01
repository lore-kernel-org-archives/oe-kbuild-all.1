Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F5B275D3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690927846; x=1722463846;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=2d4lG0fus+HJi8cGREN2Uz4QkdRHZi0TfIDeGkQenwA=;
  b=c9LbirEVeYT8jyrX2fS0vlfLqxyXRjCk+g6oXz4yeyzdAMCvhSPS3r2Y
   aYnWJVeP8ChEJMypUkb1kbwUN5UvQUq/HiwzxJdfuKGh0cGzokL3mmPI2
   PCBe/wVHL/VKqLd3E6By43Jm5iB3fD7btW2ErcSoTrKF6rzEva4KY2aK7
   zrgWm6ctYbBx6Nr8UYLs7SH6ORJpiO27YlXEckYZjnCjxrQapqaEyhKaa
   PSvewcvljKQICFXs7C2dQH8pm3rXx6RQ1XqS2A1owWj/8oz8rfyg6Xv08
   EnaZPpHNXGNBMwMb4Fyoi4EUz5mG9Q6U6/PBaPDFRkDFX/fa0lrOaZYx0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400370011"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="400370011"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 15:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="975449063"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="975449063"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 15:10:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQxZj-0000cl-1c;
	Tue, 01 Aug 2023 22:10:43 +0000
Date: Wed, 2 Aug 2023 06:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock
 assertion for vma and mmap
Message-ID: <ZMmCq3W7ayKzmZcD@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801220733.1987762-3-surenb@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock assertion for vma and mmap
Link: https://lore.kernel.org/stable/20230801220733.1987762-3-surenb%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



