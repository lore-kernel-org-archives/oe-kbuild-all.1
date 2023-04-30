Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2671191
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682859747; x=1714395747;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=FfxDSkrde9RoDw6AMXvkTRYqlZEvxC7SB9AvMOZkcCg=;
  b=hIPei9LqcJy1wjkMLZvztmGsJu9os+RUNkvgBvXde95Lwp3o51gdkP7l
   wgZe9jpvV42T6XEx+FU5rJMmjavEA4G73HQO6vJcqNvBcEa5iZvPmAqUD
   onVBmK/eSxZApLed0iqPi3KpBrxVgZHV6BlnSWLlpnXT1/a/LNin06/M/
   kR5Xq08EagPjL85MZ1aIO590wJfdc6m7PDfO7tvW42alCxBHzaoV0sTtr
   /Ku/Snv8va703ThBAKss3S3RQZJXdnNWydHZIfuOskEcIPy574FZmeNq1
   xFhhdqYMLdrILnXbDNdnWAfZieF1Fv+c16Q0MX8m1ShKxh05ft8HOBXhX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="327650919"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="327650919"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 06:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="645831960"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="645831960"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Apr 2023 06:02:24 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt6h6-0001eT-2k;
	Sun, 30 Apr 2023 13:02:24 +0000
Date: Sun, 30 Apr 2023 21:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/mempolicy: Correctly update prev when policy is equal
 on mbind
Message-ID: <ZE5mvT5Swo6Vggi7@afc780e125e2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db42467a692d78c654ec5c1953329401bd8a9c34.1682859234.git.lstoakes@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] mm/mempolicy: Correctly update prev when policy is equal on mbind
Link: https://lore.kernel.org/stable/db42467a692d78c654ec5c1953329401bd8a9c34.1682859234.git.lstoakes%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



