Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E8D8487
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676917768; x=1708453768;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=f5RO/joC0gXsF+yE2YILF5NEdjaki0fS57mNhKxw3ns=;
  b=hKnQJwg1kJbwTXId72psUVzZL1X84mQjxrrk0HWiKgnXewukEimCJROW
   lPwjd+wz1F34A7VBV8hoB8mh5qV8o4Tbp2AlWDVu/4xJ5clir0wT4EIfe
   WRU5tIdAZ31+opAJmz2749AEJZuTbPEj0PY51CPaCOVDfIuej3Lesk+aJ
   zPDQ0G3b58HSRAIlxy/JN92hrGLW9DRhOBlYuxvm1V85Wx0X7ykxyMCiC
   oEcK0LlzP7EQcJo+6Ku6FwX7o4hB++aLbaYWq+78juhbaA3wXawRZehMD
   jqCW6HLT350H2MyYjMhkRCUGf1TtAU0sikQehEUc8hVAgzY8P/D0pGeUa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="330180970"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="330180970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 10:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="648914113"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="648914113"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Feb 2023 10:29:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUAuj-000E6V-1W;
	Mon, 20 Feb 2023 18:29:25 +0000
Date: Tue, 21 Feb 2023 02:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] x86/bugs: Allow STIBP with IBRS
Message-ID: <Y/O7z6r6rzcIYN3q@a5b9dd7d9a79>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220182717.uzrym2gtavlbjbxo@treble>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] x86/bugs: Allow STIBP with IBRS
Link: https://lore.kernel.org/stable/20230220182717.uzrym2gtavlbjbxo%40treble

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



