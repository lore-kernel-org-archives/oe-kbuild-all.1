Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D501E528
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691068839; x=1722604839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YxMDdwofIrNP7i680TZcMe4YpznNLpYvBUEHi/vv6ZU=;
  b=afrDbXv/mDL8sBkCuYZvdDptBvY2AvQakQtpCSOtWAo7850VcdYSmL+4
   PJTgeaLBPutyNnUX1yYgUvf/RmcTP9yrvYfdK+G1rzL2nWKapmQBxqPh0
   vW0XWUx+PBGbddNeBJs7hX5OQrpNqy4LnAJUzOjdLtdiySjmOCzbK7MFk
   jTy4S5yYIe6PTObU593Zz2i2yD80dPXvqsPhcECQtjvFGjW6uP4t8FTcP
   5kFEeSAzfnx9Uj2AXz9GDOXOx04bzefePfzLXMWNQJ/SUA4HtlEpvFgeK
   iBli+Ue0odsw2YhOX9otUi7P2hOG1PPAwY4XIPJhwhtP5szGlxlWNZs7n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367323737"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="367323737"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 06:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853250382"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="853250382"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Aug 2023 06:18:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRYDi-00027j-1M;
	Thu, 03 Aug 2023 13:18:26 +0000
Date: Thu, 3 Aug 2023 21:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geliang Tang <geliang.tang@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Florent Revest <revest@chromium.org>,
	Brendan Jackman <jackmanb@chromium.org>,
	Matthieu Baerts <matthieu.baerts@tessares.net>,
	Mat Martineau <martineau@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>, Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Geliang Tang <geliang.tang@suse.com>, bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v8 1/4] bpf: Add update_socket_protocol hook
Message-ID: <202308032054.aq4D9VOg-lkp@intel.com>
References: <120b307aacd1791fac016d33e112069ffb7db21a.1691047403.git.geliang.tang@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <120b307aacd1791fac016d33e112069ffb7db21a.1691047403.git.geliang.tang@suse.com>

Hi Geliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Geliang-Tang/bpf-Add-update_socket_protocol-hook/20230803-153209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/120b307aacd1791fac016d33e112069ffb7db21a.1691047403.git.geliang.tang%40suse.com
patch subject: [PATCH bpf-next v8 1/4] bpf: Add update_socket_protocol hook
config: nios2-randconfig-r006-20230731 (https://download.01.org/0day-ci/archive/20230803/202308032054.aq4D9VOg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032054.aq4D9VOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308032054.aq4D9VOg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/socket.c:1648: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *      A hook for bpf progs to attach to and update socket protocol.


vim +1648 net/socket.c

  1646	
  1647	/**
> 1648	 *	A hook for bpf progs to attach to and update socket protocol.
  1649	 *
  1650	 *	A static noinline declaration here could cause the compiler to
  1651	 *	optimize away the function. A global noinline declaration will
  1652	 *	keep the definition, but may optimize away the callsite.
  1653	 *	Therefore, __weak is needed to ensure that the call is still
  1654	 *	emitted, by telling the compiler that we don't know what the
  1655	 *	function might eventually be.
  1656	 *
  1657	 *	__diag_* below are needed to dismiss the missing prototype warning.
  1658	 */
  1659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
