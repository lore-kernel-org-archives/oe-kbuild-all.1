Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BC446BD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687771211; x=1719307211;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=UAr7VLhqd3G4sFGx64mLdlDTgYzrAy/Bn+bdErb2mgU=;
  b=Ui0pu5YrYnV1d5lis3bxYMV3/ddL1OAGFZXKch/wfUug1tKpOZF+UZl+
   ye87+I1VqMX1a6FzsLUkemJ7+KUAg/uNZiUrEFyEyLfIdGifF1jhk1L+c
   q9KN+XvXOkijQHp/MZc/0QYoNB7Adnbw0eYZ1W+vL5SjYCCZOcOTo4dnl
   bRdXqTchkbCCLj/x3c5/r0UsuuhSbghzW81HNWmZJIvsKSlzAt8yzEfQ6
   3gf4VmUfKxZR3Ay7dUGJB2Zbd3PfYueI6kUloYc6CuwMXpvhq0QdRjcVA
   iZMzY97ApKi0esttcuq7zE9yYgziCdH3jTm1o3BLqF/CsloISF0ElmW8y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="341559521"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="341559521"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 02:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="710152402"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="710152402"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Jun 2023 02:20:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDiOA-000Aar-37;
	Mon, 26 Jun 2023 09:20:02 +0000
Date: Mon, 26 Jun 2023 17:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: souradeep chakrabarti <schakrabarti@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2 V3 net] net: mana: Fix MANA VF unload when host is
 unresponsive
Message-ID: <ZJlYCCClK4GzblA+@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687771098-26775-1-git-send-email-schakrabarti@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/2 V3 net] net: mana: Fix MANA VF unload when host is unresponsive
Link: https://lore.kernel.org/stable/1687771098-26775-1-git-send-email-schakrabarti%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



