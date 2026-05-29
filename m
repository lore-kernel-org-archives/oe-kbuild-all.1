Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841413A8737
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 19:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084252; cv=none; b=R9VSOLAsf3KGvEnHuZ46nqnt+hAV58H5iSUHzmc8pROl8xeYFBhfmI+7qzMyLLklhxD6Z+RunwJGWbgVEnpbfWgp8TmdAmRp3quqYLelkrniFxnAHmlMbilCCgzKFP56ww5DTmd+FiAZ6rIzqW6ntd9dv1N6H3QoN5081lmXWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084252; c=relaxed/simple;
	bh=Xy47Vb9m65sQMnuPVEfRiE4rCqGWTQXYogQjJ4vAUFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAPJrGFg72Ziz0Hgno8DdpzuzOEZDMV1OreDo5Zrqr+rdGqE7wZ6YDodUTWRi9XL/gauIDoMg2ymKJBsRS6gnC788+CNl70ITyS5JxIES4g71WflzxMlPfzAhEysi1aLc9PdJKpR0pX/tsTjXJnuNIrFS0XtUZchjw5pQeQ1P88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nK70ITUY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nK70ITUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780084250; x=1811620250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xy47Vb9m65sQMnuPVEfRiE4rCqGWTQXYogQjJ4vAUFE=;
  b=nK70ITUYLNX9jvJlutiXa9dQyRkAy9JsQgHvYfdJQjLb7eIoKGDNmfbj
   7AAvqqEFmgXqpO0jsH3NnLbqsCk4OyJlfBti/Z73JuHFY+xjw14sBW0B7
   MvneNUt7tuAEfCiXPVHdlq/ML64ppAkYidk/sImEJ7SFH6yuKiRbojU6a
   dK6ZOkOdr1w0AYN8WdhtGd2g/OUS5N1RNIrW35mYybjxjEbuyGTgaHJwI
   dSDDntZJUiS3GhNv9OjsVVUyznBUaZviVpMKbkwvdRYoMohS82A6PkHZf
   PCjKiVBqZvFfoxbSerEAHDC7g4Yx1Sv+hxRvLLDAXOvFNR1lFLj3yoAdg
   w==;
X-CSE-ConnectionGUID: e8XpzqQHSFigg0Q0H+MKpg==
X-CSE-MsgGUID: RvaeLwnpRSiAzKn2cTxlWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91252444"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91252444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 12:50:49 -0700
X-CSE-ConnectionGUID: caj/6dIZQ8mge6IaX0afWA==
X-CSE-MsgGUID: +stMZUGZScOU1l87RpGVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="246946747"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2026 12:50:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT3EC-000000007dq-1Gfm;
	Fri, 29 May 2026 19:50:44 +0000
Date: Sat, 30 May 2026 03:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/boot: remove unused min_t/max_t macros
Message-ID: <202605300340.G7sL2jlK-lkp@intel.com>
References: <20260525091839.817778-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525091839.817778-3-thorsten.blum@linux.dev>

Hi Thorsten,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v7.1-rc5 next-20260528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thorsten-Blum/powerpc-boot-remove-unused-min_t-max_t-macros/20260525-172120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260525091839.817778-3-thorsten.blum%40linux.dev
patch subject: [PATCH] powerpc/boot: remove unused min_t/max_t macros
config: powerpc64-randconfig-r061-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300340.G7sL2jlK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300340.G7sL2jlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300340.G7sL2jlK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/boot/decompress.c:37:
   In file included from arch/powerpc/boot/../../../lib/decompress_unxz.c:241:
>> arch/powerpc/boot/../../../lib/xz/xz_dec_stream.c:158:21: error: call to undeclared function 'min_t'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     158 |         size_t copy_size = min_t(size_t,
         |                            ^
>> arch/powerpc/boot/../../../lib/xz/xz_dec_stream.c:158:27: error: unexpected type name 'size_t': expected expression
     158 |         size_t copy_size = min_t(size_t,
         |                                  ^
   In file included from arch/powerpc/boot/decompress.c:37:
   In file included from arch/powerpc/boot/../../../lib/decompress_unxz.c:242:
>> arch/powerpc/boot/../../../lib/xz/xz_dec_lzma2.c:357:9: error: call to undeclared function 'min_t'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     357 |         left = min_t(size_t, dict->limit - dict->pos, *len);
         |                ^
>> arch/powerpc/boot/../../../lib/xz/xz_dec_lzma2.c:357:15: error: unexpected type name 'size_t': expected expression
     357 |         left = min_t(size_t, dict->limit - dict->pos, *len);
         |                      ^
   arch/powerpc/boot/../../../lib/xz/xz_dec_lzma2.c:1101:25: error: call to undeclared function 'min_t'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1101 |                         dict_limit(&s->dict, min_t(size_t,
         |                                              ^
   arch/powerpc/boot/../../../lib/xz/xz_dec_lzma2.c:1101:31: error: unexpected type name 'size_t': expected expression
    1101 |                         dict_limit(&s->dict, min_t(size_t,
         |                                                    ^
   In file included from arch/powerpc/boot/decompress.c:37:
   In file included from arch/powerpc/boot/../../../lib/decompress_unxz.c:243:
>> arch/powerpc/boot/../../../lib/xz/xz_dec_bcj.c:469:14: error: call to undeclared function 'min_t'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     469 |         copy_size = min_t(size_t, s->temp.filtered, b->out_size - b->out_pos);
         |                     ^
>> arch/powerpc/boot/../../../lib/xz/xz_dec_bcj.c:469:20: error: unexpected type name 'size_t': expected expression
     469 |         copy_size = min_t(size_t, s->temp.filtered, b->out_size - b->out_pos);
         |                           ^
   8 errors generated.


vim +/min_t +158 arch/powerpc/boot/../../../lib/xz/xz_dec_stream.c

24fa0402a9b6a5 Lasse Collin 2011-01-12  149  
24fa0402a9b6a5 Lasse Collin 2011-01-12  150  /*
24fa0402a9b6a5 Lasse Collin 2011-01-12  151   * Fill s->temp by copying data starting from b->in[b->in_pos]. Caller
24fa0402a9b6a5 Lasse Collin 2011-01-12  152   * must have set s->temp.pos to indicate how much data we are supposed
24fa0402a9b6a5 Lasse Collin 2011-01-12  153   * to copy into s->temp.buf. Return true once s->temp.pos has reached
24fa0402a9b6a5 Lasse Collin 2011-01-12  154   * s->temp.size.
24fa0402a9b6a5 Lasse Collin 2011-01-12  155   */
24fa0402a9b6a5 Lasse Collin 2011-01-12  156  static bool fill_temp(struct xz_dec *s, struct xz_buf *b)
24fa0402a9b6a5 Lasse Collin 2011-01-12  157  {
24fa0402a9b6a5 Lasse Collin 2011-01-12 @158  	size_t copy_size = min_t(size_t,
24fa0402a9b6a5 Lasse Collin 2011-01-12  159  			b->in_size - b->in_pos, s->temp.size - s->temp.pos);
24fa0402a9b6a5 Lasse Collin 2011-01-12  160  
24fa0402a9b6a5 Lasse Collin 2011-01-12  161  	memcpy(s->temp.buf + s->temp.pos, b->in + b->in_pos, copy_size);
24fa0402a9b6a5 Lasse Collin 2011-01-12  162  	b->in_pos += copy_size;
24fa0402a9b6a5 Lasse Collin 2011-01-12  163  	s->temp.pos += copy_size;
24fa0402a9b6a5 Lasse Collin 2011-01-12  164  
24fa0402a9b6a5 Lasse Collin 2011-01-12  165  	if (s->temp.pos == s->temp.size) {
24fa0402a9b6a5 Lasse Collin 2011-01-12  166  		s->temp.pos = 0;
24fa0402a9b6a5 Lasse Collin 2011-01-12  167  		return true;
24fa0402a9b6a5 Lasse Collin 2011-01-12  168  	}
24fa0402a9b6a5 Lasse Collin 2011-01-12  169  
24fa0402a9b6a5 Lasse Collin 2011-01-12  170  	return false;
24fa0402a9b6a5 Lasse Collin 2011-01-12  171  }
24fa0402a9b6a5 Lasse Collin 2011-01-12  172  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
