Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4DB5221
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jan 2023 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673297894; x=1704833894;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=oxaBLBiyy8sDivw/x/aJdQJ4utjCEgcX7oI2CFlquCs=;
  b=jZl8tTjo24WGdN5PgBi5IBfaWtzk11Kq9NAq5u+pbxns9rVZQ6wYJyUQ
   I/LLv9/5pZ+B8bYjNe6YxtSkew1l6ue6xuuqeuWOFRlvpOoG4lqeFJCxX
   oStsGeUxPRK7G3v8TNPH69iCOYe39h3GTEPyU0ouma7CMUY3oE9gWHEUB
   nDZBRuk29BNr/BGKY8F5VS85R6PYVpe56NMPoyv9B+utRc6V5lXRnV2zd
   uzycmgapROd4en0GGDxn815zIhP03MyuJsD3yw9UsJkML+89gqHSNpWyZ
   pnSusSbS/Lgxoea907/Nh79e5wxmYbxXGHRcJDszwdNjd7xmHAYEVqTbW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="387427895"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="387427895"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 12:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="780815460"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; 
   d="scan'208";a="780815460"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Jan 2023 12:58:13 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pEzDg-0007EQ-1A;
	Mon, 09 Jan 2023 20:58:12 +0000
Date: Tue, 10 Jan 2023 04:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Howlett <liam.howlett@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nommu: Fix do_munmap() error path
Message-ID: <Y7x/3kkRKM5wWEjX@d82c38c126d2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109205708.956103-1-Liam.Howlett@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] nommu: Fix do_munmap() error path
Link: https://lore.kernel.org/stable/20230109205708.956103-1-Liam.Howlett%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



