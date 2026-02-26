Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09D44D027
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 19:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133383; cv=none; b=kPa4EuhAgjwEEkdcOI5XT6itAgb8M5Qf+fT6ZSkRmyalK4GjpjUvgPood6CoBbCe/LxFxMKEzBxU76bIsj6szE8WwcTfCZ2CHUt6AlDNJT2THeWEddzCPhnPXUuyhywLZ32Vw88jdtvYkcOvBgVT4tmVFpVyhjpLg0B+fOETrfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133383; c=relaxed/simple;
	bh=4BUZXNOR5VEfdE7HvqCb7Whjx3m8A1PANsyeCHq5jwI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uvRnySEmV64z2f6SyyTzARytaTwhnQJlqr3OHCfkJm3MUZqkCixsQY5naVBMEIAwWhcfZfQ3HkFFTTZumqpk8PXiiBcLt/G0dgvBHSH6Pq5qVgIH/TArDOmGCtEmMVOFyGqW/v8bEnuMLG4nJbwADYJfPibQO4y6HxOiyhzdmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5n8EvTS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5n8EvTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772133379; x=1803669379;
  h=date:from:to:cc:subject:message-id;
  bh=4BUZXNOR5VEfdE7HvqCb7Whjx3m8A1PANsyeCHq5jwI=;
  b=l5n8EvTSdnr2duZgtqx9urWxvRLMX7EBpMjq47TNv9JFdVIUjYYXstoi
   YixhIQV41ZLOVv8x8NVYoz6TjoGKNwQbn6ILiZB78BIrMorPOqSHlaQFK
   Y0KByBXQ1aGWQI9VYOJy9s7xUkvONSQsH+oiBNfW5ESIk/+Ri3ReICG06
   /S4JIp59WArI9AxSIHZFz2A0NrlEnKt8wj5CGHIB1f8/A/Y/71EM0yrGu
   zclLDi3NJO5L4Eur8uvZxaa1raLRbKaiB5b6b1JIdOykF/QTc5fbxzvzI
   Qc1R2TsaZN0/BKnN0mYztOdOlWLkcFHYfu+yv//leoCzR9MiS91TGhRn1
   Q==;
X-CSE-ConnectionGUID: SD6NLO5sQdalkM/pM4Dsiw==
X-CSE-MsgGUID: FRKhetRPR2KJ19fmta0kwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72908886"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72908886"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:16:17 -0800
X-CSE-ConnectionGUID: jATfAtmNQVevkBwwfK487w==
X-CSE-MsgGUID: t2GJGhw/TJGzO45JPR6Hww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="215792271"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2026 11:16:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvgqL-000000000HP-48tX;
	Thu, 26 Feb 2026 19:16:13 +0000
Date: Thu, 26 Feb 2026 20:16:08 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 204/204]
 crypto/af_alg.c:498: warning: Function parameter or member 'sk' not described
 in 'af_alg_alloc_tsgl'
Message-ID: <202602262032.PpbBG3TO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35f57154fdf571b6197d177d629776af701f38a7
commit: 50f3b00d4c7ba9aef6e0be4db192ee81f4f8a125 [204/204] libsubcmd: Fix use-after-free for realloc(..., 0)
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260226/202602262032.PpbBG3TO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602262032.PpbBG3TO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262032.PpbBG3TO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/af_alg.c:498: warning: Function parameter or member 'sk' not described in 'af_alg_alloc_tsgl'
>> crypto/af_alg.c:539: warning: Function parameter or member 'sk' not described in 'af_alg_count_tsgl'
>> crypto/af_alg.c:539: warning: Function parameter or member 'bytes' not described in 'af_alg_count_tsgl'
>> crypto/af_alg.c:539: warning: Function parameter or member 'offset' not described in 'af_alg_count_tsgl'
>> crypto/af_alg.c:596: warning: Function parameter or member 'sk' not described in 'af_alg_pull_tsgl'
>> crypto/af_alg.c:596: warning: Function parameter or member 'used' not described in 'af_alg_pull_tsgl'
>> crypto/af_alg.c:596: warning: Function parameter or member 'dst' not described in 'af_alg_pull_tsgl'
>> crypto/af_alg.c:596: warning: Function parameter or member 'dst_offset' not described in 'af_alg_pull_tsgl'
>> crypto/af_alg.c:663: warning: Function parameter or member 'areq' not described in 'af_alg_free_areq_sgls'
>> crypto/af_alg.c:700: warning: Function parameter or member 'sk' not described in 'af_alg_wait_for_wmem'
>> crypto/af_alg.c:700: warning: Function parameter or member 'flags' not described in 'af_alg_wait_for_wmem'
>> crypto/af_alg.c:731: warning: Function parameter or member 'sk' not described in 'af_alg_wmem_wakeup'
>> crypto/af_alg.c:757: warning: Function parameter or member 'sk' not described in 'af_alg_wait_for_data'
>> crypto/af_alg.c:757: warning: Function parameter or member 'flags' not described in 'af_alg_wait_for_data'
>> crypto/af_alg.c:757: warning: Function parameter or member 'min' not described in 'af_alg_wait_for_data'
>> crypto/af_alg.c:796: warning: Function parameter or member 'sk' not described in 'af_alg_data_wakeup'
>> crypto/af_alg.c:832: warning: Function parameter or member 'sock' not described in 'af_alg_sendmsg'
>> crypto/af_alg.c:832: warning: Function parameter or member 'msg' not described in 'af_alg_sendmsg'
>> crypto/af_alg.c:832: warning: Function parameter or member 'size' not described in 'af_alg_sendmsg'
>> crypto/af_alg.c:832: warning: Function parameter or member 'ivsize' not described in 'af_alg_sendmsg'
   crypto/af_alg.c:985: warning: Function parameter or member 'sock' not described in 'af_alg_sendpage'
   crypto/af_alg.c:985: warning: Function parameter or member 'page' not described in 'af_alg_sendpage'
   crypto/af_alg.c:985: warning: Function parameter or member 'offset' not described in 'af_alg_sendpage'
   crypto/af_alg.c:985: warning: Function parameter or member 'size' not described in 'af_alg_sendpage'
   crypto/af_alg.c:985: warning: Function parameter or member 'flags' not described in 'af_alg_sendpage'
   crypto/af_alg.c:1040: warning: Function parameter or member 'areq' not described in 'af_alg_free_resources'
   crypto/af_alg.c:1058: warning: Function parameter or member '_req' not described in 'af_alg_async_cb'
   crypto/af_alg.c:1058: warning: Function parameter or member 'err' not described in 'af_alg_async_cb'
   crypto/af_alg.c:1079: warning: Function parameter or member 'file' not described in 'af_alg_poll'
   crypto/af_alg.c:1079: warning: Function parameter or member 'sock' not described in 'af_alg_poll'
   crypto/af_alg.c:1079: warning: Function parameter or member 'wait' not described in 'af_alg_poll'
   crypto/af_alg.c:1107: warning: Function parameter or member 'sk' not described in 'af_alg_alloc_areq'
   crypto/af_alg.c:1107: warning: Function parameter or member 'areqlen' not described in 'af_alg_alloc_areq'
   crypto/af_alg.c:1139: warning: Function parameter or member 'sk' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1139: warning: Function parameter or member 'msg' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1139: warning: Function parameter or member 'flags' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1139: warning: Function parameter or member 'areq' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1139: warning: Function parameter or member 'maxsize' not described in 'af_alg_get_rsgl'
   crypto/af_alg.c:1139: warning: Function parameter or member 'outlen' not described in 'af_alg_get_rsgl'
--
>> crypto/asymmetric_keys/asymmetric_type.c:159: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_same'
>> crypto/asymmetric_keys/asymmetric_type.c:159: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_same'
>> crypto/asymmetric_keys/asymmetric_type.c:175: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_partial'
>> crypto/asymmetric_keys/asymmetric_type.c:175: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_partial'


vim +498 crypto/af_alg.c

03c8efc1ffeb6b Herbert Xu          2010-10-19  490  
2d97591ef43d05 Stephan Mueller     2017-08-02  491  /**
2d97591ef43d05 Stephan Mueller     2017-08-02  492   * af_alg_alloc_tsgl - allocate the TX SGL
2d97591ef43d05 Stephan Mueller     2017-08-02  493   *
2d97591ef43d05 Stephan Mueller     2017-08-02  494   * @sk socket of connection to user space
2d97591ef43d05 Stephan Mueller     2017-08-02  495   * @return: 0 upon success, < 0 upon error
2d97591ef43d05 Stephan Mueller     2017-08-02  496   */
466e0759269d31 Eric Biggers        2019-01-10  497  static int af_alg_alloc_tsgl(struct sock *sk)
2d97591ef43d05 Stephan Mueller     2017-08-02 @498  {
2d97591ef43d05 Stephan Mueller     2017-08-02  499  	struct alg_sock *ask = alg_sk(sk);
2d97591ef43d05 Stephan Mueller     2017-08-02  500  	struct af_alg_ctx *ctx = ask->private;
2d97591ef43d05 Stephan Mueller     2017-08-02  501  	struct af_alg_tsgl *sgl;
2d97591ef43d05 Stephan Mueller     2017-08-02  502  	struct scatterlist *sg = NULL;
2d97591ef43d05 Stephan Mueller     2017-08-02  503  
2d97591ef43d05 Stephan Mueller     2017-08-02  504  	sgl = list_entry(ctx->tsgl_list.prev, struct af_alg_tsgl, list);
2d97591ef43d05 Stephan Mueller     2017-08-02  505  	if (!list_empty(&ctx->tsgl_list))
2d97591ef43d05 Stephan Mueller     2017-08-02  506  		sg = sgl->sg;
2d97591ef43d05 Stephan Mueller     2017-08-02  507  
2d97591ef43d05 Stephan Mueller     2017-08-02  508  	if (!sg || sgl->cur >= MAX_SGL_ENTS) {
0ed2dd03b94b7b Kees Cook           2018-05-08  509  		sgl = sock_kmalloc(sk,
0ed2dd03b94b7b Kees Cook           2018-05-08  510  				   struct_size(sgl, sg, (MAX_SGL_ENTS + 1)),
2d97591ef43d05 Stephan Mueller     2017-08-02  511  				   GFP_KERNEL);
2d97591ef43d05 Stephan Mueller     2017-08-02  512  		if (!sgl)
2d97591ef43d05 Stephan Mueller     2017-08-02  513  			return -ENOMEM;
2d97591ef43d05 Stephan Mueller     2017-08-02  514  
2d97591ef43d05 Stephan Mueller     2017-08-02  515  		sg_init_table(sgl->sg, MAX_SGL_ENTS + 1);
2d97591ef43d05 Stephan Mueller     2017-08-02  516  		sgl->cur = 0;
2d97591ef43d05 Stephan Mueller     2017-08-02  517  
2d97591ef43d05 Stephan Mueller     2017-08-02  518  		if (sg)
2d97591ef43d05 Stephan Mueller     2017-08-02  519  			sg_chain(sg, MAX_SGL_ENTS + 1, sgl->sg);
2d97591ef43d05 Stephan Mueller     2017-08-02  520  
2d97591ef43d05 Stephan Mueller     2017-08-02  521  		list_add_tail(&sgl->list, &ctx->tsgl_list);
2d97591ef43d05 Stephan Mueller     2017-08-02  522  	}
2d97591ef43d05 Stephan Mueller     2017-08-02  523  
2d97591ef43d05 Stephan Mueller     2017-08-02  524  	return 0;
2d97591ef43d05 Stephan Mueller     2017-08-02  525  }
2d97591ef43d05 Stephan Mueller     2017-08-02  526  
2d97591ef43d05 Stephan Mueller     2017-08-02  527  /**
2d97591ef43d05 Stephan Mueller     2017-08-02  528   * aead_count_tsgl - Count number of TX SG entries
2d97591ef43d05 Stephan Mueller     2017-08-02  529   *
2d97591ef43d05 Stephan Mueller     2017-08-02  530   * The counting starts from the beginning of the SGL to @bytes. If
2d97591ef43d05 Stephan Mueller     2017-08-02  531   * an offset is provided, the counting of the SG entries starts at the offset.
2d97591ef43d05 Stephan Mueller     2017-08-02  532   *
2d97591ef43d05 Stephan Mueller     2017-08-02  533   * @sk socket of connection to user space
2d97591ef43d05 Stephan Mueller     2017-08-02  534   * @bytes Count the number of SG entries holding given number of bytes.
2d97591ef43d05 Stephan Mueller     2017-08-02  535   * @offset Start the counting of SG entries from the given offset.
2d97591ef43d05 Stephan Mueller     2017-08-02  536   * @return Number of TX SG entries found given the constraints
2d97591ef43d05 Stephan Mueller     2017-08-02  537   */
2d97591ef43d05 Stephan Mueller     2017-08-02  538  unsigned int af_alg_count_tsgl(struct sock *sk, size_t bytes, size_t offset)
2d97591ef43d05 Stephan Mueller     2017-08-02 @539  {
7c39edfb040078 Eric Biggers        2019-01-10  540  	const struct alg_sock *ask = alg_sk(sk);
7c39edfb040078 Eric Biggers        2019-01-10  541  	const struct af_alg_ctx *ctx = ask->private;
7c39edfb040078 Eric Biggers        2019-01-10  542  	const struct af_alg_tsgl *sgl;
2d97591ef43d05 Stephan Mueller     2017-08-02  543  	unsigned int i;
2d97591ef43d05 Stephan Mueller     2017-08-02  544  	unsigned int sgl_count = 0;
2d97591ef43d05 Stephan Mueller     2017-08-02  545  
2d97591ef43d05 Stephan Mueller     2017-08-02  546  	if (!bytes)
2d97591ef43d05 Stephan Mueller     2017-08-02  547  		return 0;
2d97591ef43d05 Stephan Mueller     2017-08-02  548  
7c39edfb040078 Eric Biggers        2019-01-10  549  	list_for_each_entry(sgl, &ctx->tsgl_list, list) {
7c39edfb040078 Eric Biggers        2019-01-10  550  		const struct scatterlist *sg = sgl->sg;
2d97591ef43d05 Stephan Mueller     2017-08-02  551  
2d97591ef43d05 Stephan Mueller     2017-08-02  552  		for (i = 0; i < sgl->cur; i++) {
2d97591ef43d05 Stephan Mueller     2017-08-02  553  			size_t bytes_count;
2d97591ef43d05 Stephan Mueller     2017-08-02  554  
2d97591ef43d05 Stephan Mueller     2017-08-02  555  			/* Skip offset */
2d97591ef43d05 Stephan Mueller     2017-08-02  556  			if (offset >= sg[i].length) {
2d97591ef43d05 Stephan Mueller     2017-08-02  557  				offset -= sg[i].length;
2d97591ef43d05 Stephan Mueller     2017-08-02  558  				bytes -= sg[i].length;
2d97591ef43d05 Stephan Mueller     2017-08-02  559  				continue;
2d97591ef43d05 Stephan Mueller     2017-08-02  560  			}
2d97591ef43d05 Stephan Mueller     2017-08-02  561  
2d97591ef43d05 Stephan Mueller     2017-08-02  562  			bytes_count = sg[i].length - offset;
2d97591ef43d05 Stephan Mueller     2017-08-02  563  
2d97591ef43d05 Stephan Mueller     2017-08-02  564  			offset = 0;
2d97591ef43d05 Stephan Mueller     2017-08-02  565  			sgl_count++;
2d97591ef43d05 Stephan Mueller     2017-08-02  566  
2d97591ef43d05 Stephan Mueller     2017-08-02  567  			/* If we have seen requested number of bytes, stop */
2d97591ef43d05 Stephan Mueller     2017-08-02  568  			if (bytes_count >= bytes)
2d97591ef43d05 Stephan Mueller     2017-08-02  569  				return sgl_count;
2d97591ef43d05 Stephan Mueller     2017-08-02  570  
2d97591ef43d05 Stephan Mueller     2017-08-02  571  			bytes -= bytes_count;
2d97591ef43d05 Stephan Mueller     2017-08-02  572  		}
2d97591ef43d05 Stephan Mueller     2017-08-02  573  	}
2d97591ef43d05 Stephan Mueller     2017-08-02  574  
2d97591ef43d05 Stephan Mueller     2017-08-02  575  	return sgl_count;
2d97591ef43d05 Stephan Mueller     2017-08-02  576  }
2d97591ef43d05 Stephan Mueller     2017-08-02  577  EXPORT_SYMBOL_GPL(af_alg_count_tsgl);
2d97591ef43d05 Stephan Mueller     2017-08-02  578  
2d97591ef43d05 Stephan Mueller     2017-08-02  579  /**
2d97591ef43d05 Stephan Mueller     2017-08-02  580   * aead_pull_tsgl - Release the specified buffers from TX SGL
2d97591ef43d05 Stephan Mueller     2017-08-02  581   *
2d97591ef43d05 Stephan Mueller     2017-08-02  582   * If @dst is non-null, reassign the pages to dst. The caller must release
2d97591ef43d05 Stephan Mueller     2017-08-02  583   * the pages. If @dst_offset is given only reassign the pages to @dst starting
2d97591ef43d05 Stephan Mueller     2017-08-02  584   * at the @dst_offset (byte). The caller must ensure that @dst is large
2d97591ef43d05 Stephan Mueller     2017-08-02  585   * enough (e.g. by using af_alg_count_tsgl with the same offset).
2d97591ef43d05 Stephan Mueller     2017-08-02  586   *
2d97591ef43d05 Stephan Mueller     2017-08-02  587   * @sk socket of connection to user space
2d97591ef43d05 Stephan Mueller     2017-08-02  588   * @used Number of bytes to pull from TX SGL
2d97591ef43d05 Stephan Mueller     2017-08-02  589   * @dst If non-NULL, buffer is reassigned to dst SGL instead of releasing. The
2d97591ef43d05 Stephan Mueller     2017-08-02  590   *	caller must release the buffers in dst.
2d97591ef43d05 Stephan Mueller     2017-08-02  591   * @dst_offset Reassign the TX SGL from given offset. All buffers before
2d97591ef43d05 Stephan Mueller     2017-08-02  592   *	       reaching the offset is released.
2d97591ef43d05 Stephan Mueller     2017-08-02  593   */
2d97591ef43d05 Stephan Mueller     2017-08-02  594  void af_alg_pull_tsgl(struct sock *sk, size_t used, struct scatterlist *dst,
2d97591ef43d05 Stephan Mueller     2017-08-02  595  		      size_t dst_offset)
2d97591ef43d05 Stephan Mueller     2017-08-02 @596  {
2d97591ef43d05 Stephan Mueller     2017-08-02  597  	struct alg_sock *ask = alg_sk(sk);
2d97591ef43d05 Stephan Mueller     2017-08-02  598  	struct af_alg_ctx *ctx = ask->private;
2d97591ef43d05 Stephan Mueller     2017-08-02  599  	struct af_alg_tsgl *sgl;
2d97591ef43d05 Stephan Mueller     2017-08-02  600  	struct scatterlist *sg;
e117765a117da3 Stephan Mueller     2017-08-30  601  	unsigned int i, j = 0;
2d97591ef43d05 Stephan Mueller     2017-08-02  602  
2d97591ef43d05 Stephan Mueller     2017-08-02  603  	while (!list_empty(&ctx->tsgl_list)) {
2d97591ef43d05 Stephan Mueller     2017-08-02  604  		sgl = list_first_entry(&ctx->tsgl_list, struct af_alg_tsgl,
2d97591ef43d05 Stephan Mueller     2017-08-02  605  				       list);
2d97591ef43d05 Stephan Mueller     2017-08-02  606  		sg = sgl->sg;
2d97591ef43d05 Stephan Mueller     2017-08-02  607  
e117765a117da3 Stephan Mueller     2017-08-30  608  		for (i = 0; i < sgl->cur; i++) {
2d97591ef43d05 Stephan Mueller     2017-08-02  609  			size_t plen = min_t(size_t, used, sg[i].length);
2d97591ef43d05 Stephan Mueller     2017-08-02  610  			struct page *page = sg_page(sg + i);
2d97591ef43d05 Stephan Mueller     2017-08-02  611  
2d97591ef43d05 Stephan Mueller     2017-08-02  612  			if (!page)
2d97591ef43d05 Stephan Mueller     2017-08-02  613  				continue;
2d97591ef43d05 Stephan Mueller     2017-08-02  614  
2d97591ef43d05 Stephan Mueller     2017-08-02  615  			/*
2d97591ef43d05 Stephan Mueller     2017-08-02  616  			 * Assumption: caller created af_alg_count_tsgl(len)
2d97591ef43d05 Stephan Mueller     2017-08-02  617  			 * SG entries in dst.
2d97591ef43d05 Stephan Mueller     2017-08-02  618  			 */
2d97591ef43d05 Stephan Mueller     2017-08-02  619  			if (dst) {
2d97591ef43d05 Stephan Mueller     2017-08-02  620  				if (dst_offset >= plen) {
2d97591ef43d05 Stephan Mueller     2017-08-02  621  					/* discard page before offset */
2d97591ef43d05 Stephan Mueller     2017-08-02  622  					dst_offset -= plen;
2d97591ef43d05 Stephan Mueller     2017-08-02  623  				} else {
2d97591ef43d05 Stephan Mueller     2017-08-02  624  					/* reassign page to dst after offset */
2d45a7e89833f8 Stephan Mueller     2017-08-10  625  					get_page(page);
2d97591ef43d05 Stephan Mueller     2017-08-02  626  					sg_set_page(dst + j, page,
2d97591ef43d05 Stephan Mueller     2017-08-02  627  						    plen - dst_offset,
2d97591ef43d05 Stephan Mueller     2017-08-02  628  						    sg[i].offset + dst_offset);
2d97591ef43d05 Stephan Mueller     2017-08-02  629  					dst_offset = 0;
2d97591ef43d05 Stephan Mueller     2017-08-02  630  					j++;
2d97591ef43d05 Stephan Mueller     2017-08-02  631  				}
2d97591ef43d05 Stephan Mueller     2017-08-02  632  			}
2d97591ef43d05 Stephan Mueller     2017-08-02  633  
2d97591ef43d05 Stephan Mueller     2017-08-02  634  			sg[i].length -= plen;
2d97591ef43d05 Stephan Mueller     2017-08-02  635  			sg[i].offset += plen;
2d97591ef43d05 Stephan Mueller     2017-08-02  636  
2d97591ef43d05 Stephan Mueller     2017-08-02  637  			used -= plen;
2d97591ef43d05 Stephan Mueller     2017-08-02  638  			ctx->used -= plen;
2d97591ef43d05 Stephan Mueller     2017-08-02  639  
2d97591ef43d05 Stephan Mueller     2017-08-02  640  			if (sg[i].length)
2d97591ef43d05 Stephan Mueller     2017-08-02  641  				return;
2d97591ef43d05 Stephan Mueller     2017-08-02  642  
2d97591ef43d05 Stephan Mueller     2017-08-02  643  			put_page(page);
2d97591ef43d05 Stephan Mueller     2017-08-02  644  			sg_assign_page(sg + i, NULL);
2d97591ef43d05 Stephan Mueller     2017-08-02  645  		}
2d97591ef43d05 Stephan Mueller     2017-08-02  646  
2d97591ef43d05 Stephan Mueller     2017-08-02  647  		list_del(&sgl->list);
91e14842f8ea8d Gustavo A. R. Silva 2019-02-21  648  		sock_kfree_s(sk, sgl, struct_size(sgl, sg, MAX_SGL_ENTS + 1));
2d97591ef43d05 Stephan Mueller     2017-08-02  649  	}
2d97591ef43d05 Stephan Mueller     2017-08-02  650  
2d97591ef43d05 Stephan Mueller     2017-08-02  651  	if (!ctx->used)
2d97591ef43d05 Stephan Mueller     2017-08-02  652  		ctx->merge = 0;
f3c802a1f30013 Herbert Xu          2020-05-30  653  	ctx->init = ctx->more;
2d97591ef43d05 Stephan Mueller     2017-08-02  654  }
2d97591ef43d05 Stephan Mueller     2017-08-02  655  EXPORT_SYMBOL_GPL(af_alg_pull_tsgl);
2d97591ef43d05 Stephan Mueller     2017-08-02  656  
2d97591ef43d05 Stephan Mueller     2017-08-02  657  /**
2d97591ef43d05 Stephan Mueller     2017-08-02  658   * af_alg_free_areq_sgls - Release TX and RX SGLs of the request
2d97591ef43d05 Stephan Mueller     2017-08-02  659   *
2d97591ef43d05 Stephan Mueller     2017-08-02  660   * @areq Request holding the TX and RX SGL
2d97591ef43d05 Stephan Mueller     2017-08-02  661   */
466e0759269d31 Eric Biggers        2019-01-10  662  static void af_alg_free_areq_sgls(struct af_alg_async_req *areq)
2d97591ef43d05 Stephan Mueller     2017-08-02 @663  {
2d97591ef43d05 Stephan Mueller     2017-08-02  664  	struct sock *sk = areq->sk;
2d97591ef43d05 Stephan Mueller     2017-08-02  665  	struct alg_sock *ask = alg_sk(sk);
2d97591ef43d05 Stephan Mueller     2017-08-02  666  	struct af_alg_ctx *ctx = ask->private;
2d97591ef43d05 Stephan Mueller     2017-08-02  667  	struct af_alg_rsgl *rsgl, *tmp;
2d97591ef43d05 Stephan Mueller     2017-08-02  668  	struct scatterlist *tsgl;
2d97591ef43d05 Stephan Mueller     2017-08-02  669  	struct scatterlist *sg;
2d97591ef43d05 Stephan Mueller     2017-08-02  670  	unsigned int i;
2d97591ef43d05 Stephan Mueller     2017-08-02  671  
2d97591ef43d05 Stephan Mueller     2017-08-02  672  	list_for_each_entry_safe(rsgl, tmp, &areq->rsgl_list, list) {
af955bf15d2c27 Jonathan Cameron    2017-12-19  673  		atomic_sub(rsgl->sg_num_bytes, &ctx->rcvused);
2d97591ef43d05 Stephan Mueller     2017-08-02  674  		af_alg_free_sg(&rsgl->sgl);
2d97591ef43d05 Stephan Mueller     2017-08-02  675  		list_del(&rsgl->list);
2d97591ef43d05 Stephan Mueller     2017-08-02  676  		if (rsgl != &areq->first_rsgl)
2d97591ef43d05 Stephan Mueller     2017-08-02  677  			sock_kfree_s(sk, rsgl, sizeof(*rsgl));
2d97591ef43d05 Stephan Mueller     2017-08-02  678  	}
2d97591ef43d05 Stephan Mueller     2017-08-02  679  
2d97591ef43d05 Stephan Mueller     2017-08-02  680  	tsgl = areq->tsgl;
887207ed9e5812 Eric Biggers        2017-11-28  681  	if (tsgl) {
2d97591ef43d05 Stephan Mueller     2017-08-02  682  		for_each_sg(tsgl, sg, areq->tsgl_entries, i) {
2d97591ef43d05 Stephan Mueller     2017-08-02  683  			if (!sg_page(sg))
2d97591ef43d05 Stephan Mueller     2017-08-02  684  				continue;
2d97591ef43d05 Stephan Mueller     2017-08-02  685  			put_page(sg_page(sg));
2d97591ef43d05 Stephan Mueller     2017-08-02  686  		}
2d97591ef43d05 Stephan Mueller     2017-08-02  687  
2d97591ef43d05 Stephan Mueller     2017-08-02  688  		sock_kfree_s(sk, tsgl, areq->tsgl_entries * sizeof(*tsgl));
2d97591ef43d05 Stephan Mueller     2017-08-02  689  	}
887207ed9e5812 Eric Biggers        2017-11-28  690  }
2d97591ef43d05 Stephan Mueller     2017-08-02  691  

:::::: The code at line 498 was first introduced by commit
:::::: 2d97591ef43d0587be22ad1b0d758d6df4999a0b crypto: af_alg - consolidation of duplicate code

:::::: TO: Stephan Mueller <smueller@chronox.de>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
