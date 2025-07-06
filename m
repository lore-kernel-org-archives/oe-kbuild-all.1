Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85CC383
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 00:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751760414; cv=none; b=G52m5kyAabKdDO7WSDzTVpDF3ETmOSVB5VFyeDVor2/qddcujjDwOabXdsKLRst8sP8g7m5wRDQFDoSu6xW0ZPj+jbGdW6mJGjfLTqJvPxOD5qxwLBdy6R0x3s+TGWNRHD3f7HBl4HCHYFV72gAc0G8dh9cm2AWqf6e+cW8e/HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751760414; c=relaxed/simple;
	bh=T6fuPzcFF93oe04+6OkyLenQ9ZZgjv4cn0QBHmhoKu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/LaX/6MCSt0cfa4xOBuvGyyNDAQrmKHTdDGcE4UckQA+FFOxk30WsoY8QdXymQbM3GNPoveQIDpb8jlcfKHx99cb9moms8DKVdsse+qn1v+JIBhvzuLvR+n5LoxpULmlBJyHKvaj0Bb9llW/uAoJGNyg0+/7uo6dPhZEI4SbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BbZiyTr0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbZiyTr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751760412; x=1783296412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T6fuPzcFF93oe04+6OkyLenQ9ZZgjv4cn0QBHmhoKu8=;
  b=BbZiyTr0AIFiCUH3sETuUVHluxK9ijtfMSfxo+bkPmnUN1PXAF+zznDs
   /+T2Iztco2WSe95EwNV0NfK443GQi7PjNEq1yNd0DwGLDRk7unsObXGsx
   Mzvkx1Cs7slXZB+CQpsp0Ot/K48KqPXubit1OI//CBj5qWwOav0m5ZaYe
   y3DFzoQ2L/jwip99kQmKuotxwHQuODnGyOVcPztshQUFlq1NL+CB38UbF
   Uu+3gH/yf+B3DEeLfNOaRcbCNLHDaopJqer/yyAuoEGcK8HKHS/ASkCkq
   /3D9Az9JoJfT0acIHcB4Dk0RPZ9T7q05BaQLANtRmR6PxcAq0dDeywvhI
   g==;
X-CSE-ConnectionGUID: Rf12IMbIREeHe6jnv9LQ4g==
X-CSE-MsgGUID: VpMTOzNORdusY+2djuNYcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53750886"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53750886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 17:06:51 -0700
X-CSE-ConnectionGUID: SHH+ThKuQHCMpT22WjNenw==
X-CSE-MsgGUID: hpsN3GA5Q9+R88SNN0blXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="155378637"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jul 2025 17:06:50 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYCu7-0004mR-2s;
	Sun, 06 Jul 2025 00:06:47 +0000
Date: Sun, 6 Jul 2025 08:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 1/3] vsprintf: Add [v]seprintf(), [v]stprintf()
Message-ID: <202507060714.2oA1Yru1-lkp@intel.com>
References: <2d20eaf1752efefcc23d0e7c5c2311dd5ae252af.1751747518.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d20eaf1752efefcc23d0e7c5c2311dd5ae252af.1751747518.git.alx@kernel.org>

Hi Alejandro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on akpm-mm/mm-nonmm-unstable linus/master vbabka-slab/for-next v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alejandro-Colomar/vsprintf-Add-v-seprintf-v-stprintf/20250706-043535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/2d20eaf1752efefcc23d0e7c5c2311dd5ae252af.1751747518.git.alx%40kernel.org
patch subject: [RFC v1 1/3] vsprintf: Add [v]seprintf(), [v]stprintf()
config: i386-buildonly-randconfig-001-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060714.2oA1Yru1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060714.2oA1Yru1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060714.2oA1Yru1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/vsprintf.c:2931:5: warning: no previous prototype for 'vstprintf' [-Wmissing-prototypes]
    2931 | int vstprintf(char *buf, size_t size, const char *fmt, va_list args)
         |     ^~~~~~~~~
   lib/vsprintf.c: In function 'vstprintf':
   lib/vsprintf.c:2935:9: warning: function 'vstprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    2935 |         len = vsnprintf(buf, size, fmt, args);
         |         ^~~
   lib/vsprintf.c: At top level:
>> lib/vsprintf.c:2994:7: warning: no previous prototype for 'vseprintf' [-Wmissing-prototypes]
    2994 | char *vseprintf(char *p, const char end[0], const char *fmt, va_list args)
         |       ^~~~~~~~~
>> lib/vsprintf.c:3047:5: warning: no previous prototype for 'stprintf' [-Wmissing-prototypes]
    3047 | int stprintf(char *buf, size_t size, const char *fmt, ...)
         |     ^~~~~~~~
>> lib/vsprintf.c:3096:7: warning: no previous prototype for 'seprintf' [-Wmissing-prototypes]
    3096 | char *seprintf(char *p, const char end[0], const char *fmt, ...)
         |       ^~~~~~~~


vim +/vstprintf +2931 lib/vsprintf.c

  2916	
  2917	/**
  2918	 * vstprintf - Format a string and place it in a buffer
  2919	 * @buf: The buffer to place the result into
  2920	 * @size: The size of the buffer, including the trailing null space
  2921	 * @fmt: The format string to use
  2922	 * @args: Arguments for the format string
  2923	 *
  2924	 * The return value is the length of the new string.
  2925	 * If the string is truncated, the function returns -E2BIG.
  2926	 *
  2927	 * If you're not already dealing with a va_list consider using stprintf().
  2928	 *
  2929	 * See the vsnprintf() documentation for format string extensions over C99.
  2930	 */
> 2931	int vstprintf(char *buf, size_t size, const char *fmt, va_list args)
  2932	{
  2933		int len;
  2934	
> 2935		len = vsnprintf(buf, size, fmt, args);
  2936	
  2937		// It seems the kernel's vsnprintf() doesn't fail?
  2938		//if (unlikely(len < 0))
  2939		//	return -E2BIG;
  2940	
  2941		if (unlikely(len >= size))
  2942			return -E2BIG;
  2943	
  2944		return len;
  2945	}
  2946	EXPORT_SYMBOL(vstprintf);
  2947	
  2948	/**
  2949	 * vscnprintf - Format a string and place it in a buffer
  2950	 * @buf: The buffer to place the result into
  2951	 * @size: The size of the buffer, including the trailing null space
  2952	 * @fmt: The format string to use
  2953	 * @args: Arguments for the format string
  2954	 *
  2955	 * The return value is the number of characters which have been written into
  2956	 * the @buf not including the trailing '\0'. If @size is == 0 the function
  2957	 * returns 0.
  2958	 *
  2959	 * If you're not already dealing with a va_list consider using scnprintf().
  2960	 *
  2961	 * See the vsnprintf() documentation for format string extensions over C99.
  2962	 */
  2963	int vscnprintf(char *buf, size_t size, const char *fmt, va_list args)
  2964	{
  2965		int i;
  2966	
  2967		if (unlikely(!size))
  2968			return 0;
  2969	
  2970		i = vsnprintf(buf, size, fmt, args);
  2971	
  2972		if (likely(i < size))
  2973			return i;
  2974	
  2975		return size - 1;
  2976	}
  2977	EXPORT_SYMBOL(vscnprintf);
  2978	
  2979	/**
  2980	 * vseprintf - Format a string and place it in a buffer
  2981	 * @p: The buffer to place the result into
  2982	 * @end: A pointer to one past the last character in the buffer
  2983	 * @fmt: The format string to use
  2984	 * @args: Arguments for the format string
  2985	 *
  2986	 * The return value is a pointer to the trailing '\0'.
  2987	 * If @p is NULL, the function returns NULL.
  2988	 * If the string is truncated, the function returns NULL.
  2989	 *
  2990	 * If you're not already dealing with a va_list consider using seprintf().
  2991	 *
  2992	 * See the vsnprintf() documentation for format string extensions over C99.
  2993	 */
> 2994	char *vseprintf(char *p, const char end[0], const char *fmt, va_list args)
  2995	{
  2996		int len;
  2997	
  2998		if (unlikely(p == NULL))
  2999			return NULL;
  3000	
  3001		len = vstprintf(p, end - p, fmt, args);
  3002		if (unlikely(len < 0))
  3003			return NULL;
  3004	
  3005		return p + len;
  3006	}
  3007	EXPORT_SYMBOL(vseprintf);
  3008	
  3009	/**
  3010	 * snprintf - Format a string and place it in a buffer
  3011	 * @buf: The buffer to place the result into
  3012	 * @size: The size of the buffer, including the trailing null space
  3013	 * @fmt: The format string to use
  3014	 * @...: Arguments for the format string
  3015	 *
  3016	 * The return value is the number of characters which would be
  3017	 * generated for the given input, excluding the trailing null,
  3018	 * as per ISO C99.  If the return is greater than or equal to
  3019	 * @size, the resulting string is truncated.
  3020	 *
  3021	 * See the vsnprintf() documentation for format string extensions over C99.
  3022	 */
  3023	int snprintf(char *buf, size_t size, const char *fmt, ...)
  3024	{
  3025		va_list args;
  3026		int i;
  3027	
  3028		va_start(args, fmt);
  3029		i = vsnprintf(buf, size, fmt, args);
  3030		va_end(args);
  3031	
  3032		return i;
  3033	}
  3034	EXPORT_SYMBOL(snprintf);
  3035	
  3036	/**
  3037	 * stprintf - Format a string and place it in a buffer
  3038	 * @buf: The buffer to place the result into
  3039	 * @size: The size of the buffer, including the trailing null space
  3040	 * @fmt: The format string to use
  3041	 * @...: Arguments for the format string
  3042	 *
  3043	 * The return value is the length of the new string.
  3044	 * If the string is truncated, the function returns -E2BIG.
  3045	 */
  3046	
> 3047	int stprintf(char *buf, size_t size, const char *fmt, ...)
  3048	{
  3049		va_list args;
  3050		int len;
  3051	
  3052		va_start(args, fmt);
  3053		len = vstprintf(buf, size, fmt, args);
  3054		va_end(args);
  3055	
  3056		return len;
  3057	}
  3058	EXPORT_SYMBOL(stprintf);
  3059	
  3060	/**
  3061	 * scnprintf - Format a string and place it in a buffer
  3062	 * @buf: The buffer to place the result into
  3063	 * @size: The size of the buffer, including the trailing null space
  3064	 * @fmt: The format string to use
  3065	 * @...: Arguments for the format string
  3066	 *
  3067	 * The return value is the number of characters written into @buf not including
  3068	 * the trailing '\0'. If @size is == 0 the function returns 0.
  3069	 */
  3070	
  3071	int scnprintf(char *buf, size_t size, const char *fmt, ...)
  3072	{
  3073		va_list args;
  3074		int i;
  3075	
  3076		va_start(args, fmt);
  3077		i = vscnprintf(buf, size, fmt, args);
  3078		va_end(args);
  3079	
  3080		return i;
  3081	}
  3082	EXPORT_SYMBOL(scnprintf);
  3083	
  3084	/**
  3085	 * seprintf - Format a string and place it in a buffer
  3086	 * @p: The buffer to place the result into
  3087	 * @end: A pointer to one past the last character in the buffer
  3088	 * @fmt: The format string to use
  3089	 * @...: Arguments for the format string
  3090	 *
  3091	 * The return value is a pointer to the trailing '\0'.
  3092	 * If @buf is NULL, the function returns NULL.
  3093	 * If the string is truncated, the function returns NULL.
  3094	 */
  3095	
> 3096	char *seprintf(char *p, const char end[0], const char *fmt, ...)
  3097	{
  3098		va_list args;
  3099	
  3100		va_start(args, fmt);
  3101		p = vseprintf(p, end, fmt, args);
  3102		va_end(args);
  3103	
  3104		return p;
  3105	}
  3106	EXPORT_SYMBOL(seprintf);
  3107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
