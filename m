Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C74256B76
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGTdsSCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667987; x=1732203987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZnuLdh38Hj5pdfpiGkPCZrHi7kCMkDXolDRHfdYdkUk=;
  b=NGTdsSCHbWeWIudbYRgssmh9iuBA46CEsRh4U1ABpSmbPFdRQHWz9Yw+
   gURMyWlk7VAwsy6X64+rZA1lCN/d1NiRYn4IZTfa9IO50KLWctF+wczy0
   dMcRN1EcV74E5qbpmBRfQvubzoBsN5LebXuHNaJ3sI5bgwZ2c0fSfj9Qd
   J93KA8pV4WWJy662jxf4dzqL7zdBLf6XgRW4xMTckUIbtFfsMCr8tkGSn
   o+XbWnRz99mrZC6o86bccMEWWf7A4jW+ZdbIO+O3qlacbjMVvL8B7s4Ia
   yA6rAZR+te5MZDMklU8rJwFgFlQliMQa9W+/rSULAN6kdr8BaVQYp+ga9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13623147"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13623147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8510494"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 07:46:22 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5pQh-0000dE-2s;
	Wed, 22 Nov 2023 15:46:19 +0000
Date: Wed, 22 Nov 2023 23:45:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Ivan Babrou <ivan@cloudflare.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: Re: [PATCH v1 net-next 4/4] af_unix: Try to run GC async.
Message-ID: <202311222204.jSne0FwB-lkp@intel.com>
References: <20231122013629.28554-5-kuniyu@amazon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122013629.28554-5-kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/af_unix-Do-not-use-atomic-ops-for-unix_sk-sk-inflight/20231122-094214
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231122013629.28554-5-kuniyu%40amazon.com
patch subject: [PATCH v1 net-next 4/4] af_unix: Try to run GC async.
config: sh-defconfig (https://download.01.org/0day-ci/archive/20231122/202311222204.jSne0FwB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311222204.jSne0FwB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311222204.jSne0FwB-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: net/core/scm.o: in function `__scm_send':
>> scm.c:(.text+0x6e8): undefined reference to `unix_get_socket'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
