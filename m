Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7919B1B280
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbE7b/7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701254585; x=1732790585;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=kohXLGKwSp1QeowEi8Un4paJ/XEzuN05g0M8Irixm8E=;
  b=gbE7b/7Bn19LawUGHYons+1zDZoSB0CIMJw+h3ZJVrwtu1o7Xweahizd
   4r29tExkG6qi4e0mblEubANxEYjhRH18PFWSbRVNBkVWuBJf4seUzvC+t
   rJep6WoCKnV6dCR0KjKRw7k241vk+3TSbyDjxbE8W/ttRNOZJtjJeQfLU
   tVpfsOQAdQd0ISBgvRkZ8HMWSZ3lpAZU3I7w1bM4xfLErfSWDcNyDVs18
   2wfQkHRrK7ZN5QMVlYqLL/CHjZ0OQyOUptHw1A7J9dab7eEk0XiNkYto0
   4a9QUJCgOv2wl6HOFwT8xc2jidKNywMY57xp8z9vuQKh7KaIoH3HRvaC7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424285723"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="424285723"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 02:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="803254034"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="803254034"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Nov 2023 02:43:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8I1z-00005z-28;
	Wed, 29 Nov 2023 10:42:59 +0000
Date: Wed, 29 Nov 2023 18:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ashwin Dayanand Kamat <kashwindayan@vmware.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] x86/sev: Update ghcb_version only once
Message-ID: <ZWcVfXrkc4nmI03s@520bc4c78bef>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701254429-18250-1-git-send-email-kashwindayan@vmware.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] x86/sev: Update ghcb_version only once
Link: https://lore.kernel.org/stable/1701254429-18250-1-git-send-email-kashwindayan%40vmware.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



