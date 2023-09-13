Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D371AD5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 22:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694643411; x=1726179411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gV5m7FnIi0psr4k+6ytGpr38jWqH/wH1K3hvo+SLTQI=;
  b=iFRRcrwmnz0dL4nJTpfGqn1jwCs4QA+hJVfAW+bgHdoIZPGLgg9pjULI
   s2XK7b72vZQQSQazmqKtkFUQ8Y+pryatS+9ITXiyivk9+Wh+S45FNnA0/
   LcaMfQag9l8mgNNsW7YLTCW5IMO9JViZanSik/KBlWtDoYarJsWIlG60o
   /jF7SCQLCS7HwZTbL2ZZG2MaflxPZj/4RwOJ8BpjPxqzV/Ox7IWP4j3JJ
   b9wrjjpsHk6BEsSRWBlYJUvS0fXsg/6QNJscpvGqwKo2KSjS1k9H1iwxb
   ZRzexnbJNNMjMTO0e6QcA0JOtbNqwavMW6WRWkE/q8JuRvcghbFTYLL+p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377706284"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377706284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 15:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694001202"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694001202"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 15:16:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgYA3-0000iz-1N;
	Wed, 13 Sep 2023 22:16:42 +0000
Date: Thu, 14 Sep 2023 06:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-security-module@vger.kernel.org, keescook@chromium.org,
	brauner@kernel.org, lennart@poettering.net, kernel-team@meta.com,
	sargun@sargun.me
Subject: Re: [PATCH v4 bpf-next 07/12] bpf: consistenly use BPF token
 throughout BPF verifier logic
Message-ID: <202309140537.jHmBqMd6-lkp@intel.com>
References: <20230912212906.3975866-8-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912212906.3975866-8-andrii@kernel.org>

Hi Andrii,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-add-BPF-token-delegation-mount-options-to-BPF-FS/20230913-053240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230912212906.3975866-8-andrii%40kernel.org
patch subject: [PATCH v4 bpf-next 07/12] bpf: consistenly use BPF token throughout BPF verifier logic
config: x86_64-randconfig-074-20230914 (https://download.01.org/0day-ci/archive/20230914/202309140537.jHmBqMd6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140537.jHmBqMd6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140537.jHmBqMd6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/sock_reuseport.h:5,
                    from include/net/tcp.h:35,
                    from include/linux/netfilter_ipv6.h:11,
                    from include/uapi/linux/netfilter_ipv6/ip6_tables.h:22,
                    from include/linux/netfilter_ipv6/ip6_tables.h:23,
                    from net/ipv6/netfilter/ip6table_filter.c:11:
   include/linux/filter.h: In function 'bpf_jit_blinding_enabled':
>> include/linux/filter.h:1104:36: error: implicit declaration of function 'bpf_token_capable'; did you mean 'bpf_token_put'? [-Werror=implicit-function-declaration]
    1104 |         if (bpf_jit_harden == 1 && bpf_token_capable(prog->aux->token, CAP_BPF))
         |                                    ^~~~~~~~~~~~~~~~~
         |                                    bpf_token_put
   cc1: some warnings being treated as errors
--
   In file included from include/net/sock_reuseport.h:5,
                    from include/net/tcp.h:35,
                    from include/linux/netfilter_ipv6.h:11,
                    from net/ipv6/netfilter/nf_reject_ipv6.c:12:
   include/linux/filter.h: In function 'bpf_jit_blinding_enabled':
>> include/linux/filter.h:1104:36: error: implicit declaration of function 'bpf_token_capable'; did you mean 'bpf_token_put'? [-Werror=implicit-function-declaration]
    1104 |         if (bpf_jit_harden == 1 && bpf_token_capable(prog->aux->token, CAP_BPF))
         |                                    ^~~~~~~~~~~~~~~~~
         |                                    bpf_token_put
   net/ipv6/netfilter/nf_reject_ipv6.c: In function 'nf_send_reset6':
   net/ipv6/netfilter/nf_reject_ipv6.c:287:25: warning: variable 'ip6h' set but not used [-Wunused-but-set-variable]
     287 |         struct ipv6hdr *ip6h;
         |                         ^~~~
   cc1: some warnings being treated as errors


vim +1104 include/linux/filter.h

  1091	
  1092	static inline bool bpf_jit_blinding_enabled(struct bpf_prog *prog)
  1093	{
  1094		/* These are the prerequisites, should someone ever have the
  1095		 * idea to call blinding outside of them, we make sure to
  1096		 * bail out.
  1097		 */
  1098		if (!bpf_jit_is_ebpf())
  1099			return false;
  1100		if (!prog->jit_requested)
  1101			return false;
  1102		if (!bpf_jit_harden)
  1103			return false;
> 1104		if (bpf_jit_harden == 1 && bpf_token_capable(prog->aux->token, CAP_BPF))
  1105			return false;
  1106	
  1107		return true;
  1108	}
  1109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
