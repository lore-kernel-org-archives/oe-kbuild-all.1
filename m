Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74A4818
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688374325; x=1719910325;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=/uvkMeGZBQFbU1x2ItiP0ExuJhY1J2uD/khcJMBV4Ac=;
  b=I+w2UJFKH2jbrtg70VE8NN5CQZcximN9d43NVSoETwj1QxmQOLIoHAyk
   TQ1zJ82DARFszP+dKKGp/ln51v/AjdzMow5qLKwyT9bR2a8AJhTT9431p
   ll0rpiiKaWhHNHhlzQ7gGXBjBWw8GX36tiW6tgUhW/4+G9qKOjIxqzYpa
   73MDeAV+v6Qyf7x70kruobyOp7/zVWASSbJSjNscaa6H39PDdgZPeC6LF
   OzD4dfyxcRBsKUayDMP+EZ7E1pRqyCa4IZso+vw1ykj5PpU/RekmPKu7c
   BDgkAEH7LTc9cK0RyU6ugtqv7/5MDb0VawXolUcCWIdN1ghDdW5kLfu7x
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426514284"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="426514284"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 01:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="718532773"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="718532773"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jul 2023 01:52:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGFHs-000HIV-39;
	Mon, 03 Jul 2023 08:52:00 +0000
Date: Mon, 3 Jul 2023 16:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: souradeep chakrabarti <schakrabarti@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V4 net] net: mana: Fix MANA VF unload when host is
 unresponsive
Message-ID: <ZKKL/a0qDLcTfi+A@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688374171-10534-1-git-send-email-schakrabarti@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH V4 net] net: mana: Fix MANA VF unload when host is unresponsive
Link: https://lore.kernel.org/stable/1688374171-10534-1-git-send-email-schakrabarti%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



