Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFA5221
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jan 2023 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673297834; x=1704833834;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=WGATvaZKNENAcof5v6X+B1QYZ2YOCfqAWjk4Z+luP/U=;
  b=MRj3334bcex4qf/oIqZabxjsP8HviAxJXzenPvqxKYaqV3wGCxaJ6Mvp
   v++cdDh1bj7qdKlXTqxpIdky9WzBIZrJ3DZwtNgshpvJQBNYPErtEHTuB
   uRSi3g6HojA8BNFnFAURcs3m0yAD+meY/Pq0szbJXoDmISTSc6OKWEr7e
   aHWluanI8R2WrzmH8NiLhL0fKOuOEb7nWhBB85BFeGhKFTgBIsja+iGT/
   U9YbPqgjfkwsXFpaANjyq7llFlfUYWBId2gf8mx7qVX4qYIKXSymYgKBm
   GUaLKADT/FB6IQe9920bAAvfCoFxVYfmrasK00WffLFm9ZONKobi2QzfM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="302678859"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="302678859"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 12:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="745500491"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="745500491"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Jan 2023 12:57:13 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pEzCi-0007EM-13;
	Mon, 09 Jan 2023 20:57:12 +0000
Date: Tue, 10 Jan 2023 04:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Howlett <liam.howlett@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nommu: Fix memory leak in do_mmap() error path
Message-ID: <Y7x/cidNmLr9QoZV@d82c38c126d2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109205507.955577-1-Liam.Howlett@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] nommu: Fix memory leak in do_mmap() error path
Link: https://lore.kernel.org/stable/20230109205507.955577-1-Liam.Howlett%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



