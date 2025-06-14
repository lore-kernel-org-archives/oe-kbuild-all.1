Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CB34CDD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749922399; cv=none; b=qHy4a/GlyvzigH7TLPW1qa7hyD9nBpphrJedvSHD/1X04Wui0z+iB/PA+cLuPXsfDM+JQSbMc2EeUa1wJaXSRVMgx+9gb70Na0FbzskxVFTCkIlOOy9w+LtnfgcG8AIJ6Gsx0GWS71aaNvNfvsh0cCbMttdCHgQW9ZzWXCi+UZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749922399; c=relaxed/simple;
	bh=sYzhyuOMJlxaNLvwtjvQFPSqgL1EZJfEM0k8Hyk2zmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exsEr6/pYGR2cFuJZkSx5f0sxX2UDtSFBDqepWUW+If8lDOMznAd1mLr471y7O+FAXY6C5DvofyXrLRzs9LJ9rsHwcwefyhWTA61nMxAZh9xaGMHxxKscqGGC74fSCw3CDf3NNLH2Zk0BkkpN9MLZrBiEHBDb93W6OpBlUftFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T56lVF9S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T56lVF9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749922398; x=1781458398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sYzhyuOMJlxaNLvwtjvQFPSqgL1EZJfEM0k8Hyk2zmE=;
  b=T56lVF9S9iaMerQBcSlex+Cfj4syesCVt/mNnfP+VuZJJ7fgC3LY9dWB
   yBwscbUNkki8pJz+vMAfMV9FqRGudXaL+OX5XvhBY1iRRQnpsciUj+354
   HJ+8kjQOUKkr6CLvDFjz0/5qsiUvMctjZ3/qr2aVPABBMXEAYjsUneVtd
   6Q23ZCIgOqDdXigqS5T3kG0mbZgb1nxG7rhigZC2aUe9vaSnQ/3SkKeFE
   Q/MjjFE3+2wP6zAA5HZH3+6OeQrNWXZ3K/RqPDJ2d8iXfcQOMmETbXUMV
   /d0U9kB3OEdZtZElYginuEDA+X6rD0ZScYVE0mjHjHeujwdss95WgQHaf
   Q==;
X-CSE-ConnectionGUID: pSq4mlErQquYM2vAEPsMcg==
X-CSE-MsgGUID: umXQFmepRbuOV6qx+wljIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="77510500"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="77510500"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 10:33:18 -0700
X-CSE-ConnectionGUID: nRDaa7ccShCXOkP3q+4CNw==
X-CSE-MsgGUID: nIM2ZCBoSemDGezcKbJKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="147953425"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2025 10:33:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQUkg-000Dj2-1v;
	Sat, 14 Jun 2025 17:33:10 +0000
Date: Sun, 15 Jun 2025 01:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuni1840@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Kuniyuki Iwashima <kuniyu@google.com>, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 bpf-next 1/4] af_unix: Don't pass struct socket to
 security_unix_may_send().
Message-ID: <202506150111.BYSccpdo-lkp@intel.com>
References: <20250613222411.1216170-2-kuni1840@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613222411.1216170-2-kuni1840@gmail.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/af_unix-Don-t-pass-struct-socket-to-security_unix_may_send/20250614-062956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250613222411.1216170-2-kuni1840%40gmail.com
patch subject: [PATCH v2 bpf-next 1/4] af_unix: Don't pass struct socket to security_unix_may_send().
config: arm-randconfig-001-20250614 (https://download.01.org/0day-ci/archive/20250615/202506150111.BYSccpdo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150111.BYSccpdo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150111.BYSccpdo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smack_lsm.c:3892 function parameter 'sk' not described in 'smack_unix_may_send'
>> Warning: security/smack/smack_lsm.c:3892 Excess function parameter 'sock' description in 'smack_unix_may_send'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
