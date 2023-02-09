Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE79733ED
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675949624; x=1707485624;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=c6a1woMwScId8bFiEUw9B9h07IJLn2W0UeFa6SHhm5U=;
  b=VoCbWMLX9mH0Y0Y9ao07eKuFzPfkXtlu/mIurZkDqrdePRh/8pYGU1ZE
   AC3Nb926yGVbdBZv1UObNRljQOjuNNYDepV9qAadfu3Zf2BYBvxKuS/Fq
   GDivEM2RRFIztFmnP8rh3nOjouFiwzHOUg1TLRoqmOWgXGrNkD29CUexn
   Ac2PKA3JU3Z4i5wUmu4lY4cYODVxGBJ/U/gq4cTSnBJ9tGVmeoCrnYKNo
   AkQ+bEx+6WGgI+Ck+ZW56+OwHYAIxQaK+y6bsikVtOKhTnwwvzWookB8e
   R55X2j0aHfVris0zFxQ5rQfCbnDfzqZgS1gx2RITK0VYtepfeoIDmGipq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310460870"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="310460870"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 05:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="698021323"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="698021323"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Feb 2023 05:33:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ73W-00056E-0B;
	Thu, 09 Feb 2023 13:33:42 +0000
Date: Thu, 9 Feb 2023 21:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] EDAC/skx: Fix overflows on the DRAM row address
 mapping arrays
Message-ID: <Y+T2NL721QUMl8/a@a5b9dd7d9a79>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209133023.39825-1-qiuxu.zhuo@intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/1] EDAC/skx: Fix overflows on the DRAM row address mapping arrays
Link: https://lore.kernel.org/stable/20230209133023.39825-1-qiuxu.zhuo%40intel.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



