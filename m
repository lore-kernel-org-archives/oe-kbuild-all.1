Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2042048
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725535; cv=none; b=sc1rj27M5lrAC0X+8DT8UaQDeUziAAGigPkvvth4SyHlh7WDC0iROQnmEkDLgwpYaS56SN4/koaIw9zipw+txZLMshzkGBUyX2vMK1sSfOKBK5qqu+NsLiJ8nB0CtX9CyoL6ROymDGgE+mxMG3ILffEOP/0HrAghryQPS6l9Fi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725535; c=relaxed/simple;
	bh=y7SwzFPgDoHtLEFXhBH3kMQFQcESnxeyNlcJKxUV7xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5FiJxnYifuqbkfxVt+LX0JY5OZ4c3gsR1OdHW3aYz6K8bq8KMr1TP08f9GMYxtgDuJYg/muu+cwEdL+5j84oXwyQzem8IeRLCGg+vinKwyODIlvwdxkIetGpXxulBgInR6zoSDrNR8W2czlp5UBtB6675BaM86Oohq7T+dznV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LeIraAk1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeIraAk1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779725534; x=1811261534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y7SwzFPgDoHtLEFXhBH3kMQFQcESnxeyNlcJKxUV7xM=;
  b=LeIraAk17icOB/antGGyDb0N3wzCFKDsL4SeQobLD7s8MRazdJkRzf5i
   bwsOQPBaESYP0Fun+83iWHp0MeFBAx9IspTSrZHWiwvWjQtW0y8Qx9WWy
   s+z3YJZ0y38xk7qmdctASwrtQuExRQksLjb22DC4EQt5Q0iYWp1PHj4cu
   k71bQTze2a/lG04UJsBxMq8NINrXBwqRFVGydC77cQvPDRItVIBylu6Y3
   mOSNOcYIkgw1eId1faINqZ2rz66dkq8ftjQeD5+FSeuIdj35fgDEtGgsn
   uoZ3OBlYVgb+F3/e1vdLCxKfdQrztv944huDQnaiwdL3Bf9n9SYSzUrDG
   w==;
X-CSE-ConnectionGUID: g/S65gYrS82th4Xplhe27A==
X-CSE-MsgGUID: vMAnukk9SUKeyD8/VYvppg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91236349"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="91236349"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 09:12:13 -0700
X-CSE-ConnectionGUID: CCjSzzFMRGKiCLP67Moy1A==
X-CSE-MsgGUID: nqfbb9PcTSm9J9DMnTCMlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="237446791"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 May 2026 09:12:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRXuU-000000001cs-0iWD;
	Mon, 25 May 2026 16:12:10 +0000
Date: Tue, 26 May 2026 00:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] SUNRPC: Reject short RFC 4121 MIC tokens in
 gss_krb5_verify_mic_v2
Message-ID: <202605260025.iqHX0Pwi-lkp@intel.com>
References: <20260523165237.510204-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523165237.510204-1-cel@kernel.org>

Hi Chuck,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v7.1-rc5 next-20260522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/SUNRPC-Reject-short-RFC-4121-MIC-tokens-in-gss_krb5_verify_mic_v2/20260524-005345
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260523165237.510204-1-cel%40kernel.org
patch subject: [PATCH] SUNRPC: Reject short RFC 4121 MIC tokens in gss_krb5_verify_mic_v2
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260526/202605260025.iqHX0Pwi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605260025.iqHX0Pwi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605260025.iqHX0Pwi-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sunrpc/auth_gss/gss_krb5_unseal.c: In function 'gss_krb5_verify_mic_v2':
>> net/sunrpc/auth_gss/gss_krb5_unseal.c:89:54: error: 'cksum_len' undeclared (first use in this function)
      89 |         if (read_token->len < GSS_KRB5_TOK_HDR_LEN + cksum_len)
         |                                                      ^~~~~~~~~
   net/sunrpc/auth_gss/gss_krb5_unseal.c:89:54: note: each undeclared identifier is reported only once for each function it appears in


vim +/cksum_len +89 net/sunrpc/auth_gss/gss_krb5_unseal.c

    69	
    70	u32
    71	gss_krb5_verify_mic_v2(struct krb5_ctx *ctx, struct xdr_buf *message_buffer,
    72			       struct xdr_netobj *read_token)
    73	{
    74		struct crypto_ahash *tfm = ctx->initiate ?
    75					   ctx->acceptor_sign : ctx->initiator_sign;
    76		char cksumdata[GSS_KRB5_MAX_CKSUM_LEN];
    77		struct xdr_netobj cksumobj = {
    78			.len	= ctx->gk5e->cksumlength,
    79			.data	= cksumdata,
    80		};
    81		u8 *ptr = read_token->data;
    82		__be16 be16_ptr;
    83		time64_t now;
    84		u8 flags;
    85		int i;
    86	
    87		dprintk("RPC:       %s\n", __func__);
    88	
  > 89		if (read_token->len < GSS_KRB5_TOK_HDR_LEN + cksum_len)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
