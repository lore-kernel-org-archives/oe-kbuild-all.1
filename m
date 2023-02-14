Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E284BA54
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676394739; x=1707930739;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3Z0VR5hYhY9LUYikBks77e38UdhiUwdO2XqkLuXPZRo=;
  b=K1F7gRbJVSFnQn94BaCiPN6fl8ahaDwXACe2Ok9GZnbyPwFEtwLAJUHH
   0yEOBpUypiYuYcI7DpdNVC+QLSWIyRR9eq4f7shLbKGZ2wB13YnMp3n2O
   tj5QdUTw/YggA67/wEa74O3CyQ06ygMUhF/VaWXyKGrxC+i9DwUvoZBV9
   zyBw5q+aqpGL0UpusZ1o7C9PwmqspU9F8zgYJROz5XnE0/WIx6JNW3zze
   9OyecES+o+KrrTyUtvr815fMHtc4xW6GNvXKzt0MLZ3IKZaTdtmlgpcO+
   /FjafxZPK2peQmP1I1dsSy/GRcHXaYL6QaGyLAlBV95WCurLUG5KVAQyT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="395824755"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="395824755"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 09:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="998148088"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="998148088"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2023 09:12:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRyqn-0008ff-0K;
	Tue, 14 Feb 2023 17:12:17 +0000
Date: Wed, 15 Feb 2023 01:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH for-5.15 3/3] Documentation/hw-vuln: Add documentation
 for Cross-Thread Return Predictions
Message-ID: <Y+vAuPVnSH1Z34m/@a5b9dd7d9a79>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214170956.1297309-4-pbonzini@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH for-5.15 3/3] Documentation/hw-vuln: Add documentation for Cross-Thread Return Predictions
Link: https://lore.kernel.org/stable/20230214170956.1297309-4-pbonzini%40redhat.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



