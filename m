Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5A4218B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482947; cv=none; b=Q4nuGQLdidp8C9ZxAiGlJE0vISJjeD+hkw7jY0drr1OwTKkMcyonSOo8YaT66eTDqgG6bIVTs15LnwXuF4NeFiyz+Xw3P6GhR9PA3mxIOGmkA6nB+CifP6nP24b2k+xcqwBtyo91PfVVVaoQd8HgGpLmc+RBdns2TmTdVfTi8f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482947; c=relaxed/simple;
	bh=PHO6bkDQS6g8L/J9qchtpcLAfTogCKqs2+elIfk+NEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OuZNSRN2OziI4sqe7dYBdcs3HzeW2ALFBeNOGNJHJfTbBireNl8AePA1j5oiKzdfGieWXoozf8PpmR8KJHSDbXnyewpy9HZmOuT+1T90PMrgbY9B3+TB4XOACrQYHDqSUaY/0HqykB3zXmyV+R1MxenptEkgsOWMiYlI3PCfTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEWSSv47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEWSSv47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A291F000E9;
	Tue, 11 Aug 2026 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786482945;
	bh=SmICxyibrBpRQrbOk7i7Af6DF7WdhgxzvPM4D5veIVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=BEWSSv47UufXSJL/BVNHK0NTGWPz3pjA0tyApsFjH/IEBQJ2i/ec59//6zoTMdOA4
	 rsN1XSw01cDTfFkj62BFqp1+sARecjQdJsx5J/gYOp9hDCCQjLgOnhXjn9mESBum9R
	 s3ZYVNjiiMP/ZwBamRg77BmTBpiicsh1hr2o7KXXNMeNwrUwbNVmu/zOt/8YePt8Dk
	 +4D8NxAUsY9AYD11je0vwKLrExjNKt2zyiSjW6KCLoKWvwpBLTwS6fQTjvbTUpst+N
	 TyYS3S6rg0K5+FnAxLdK0KGC04557eaWPiF+PXO88tzY0j+75iweJC7qiiTZnW5n49
	 RATMntKex39fw==
Date: Tue, 11 Aug 2026 16:15:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Aksh Garg <a-garg7@ti.com>, oe-kbuild-all@lists.linux.dev,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [linux-next:master 13060/13846]
 arch/powerpc/boot/decompress.c:132:8: error: call to undeclared function
 '__decompress'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20260811211543.GA697064@bhelgaas>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608111848.Kv74vVhw-lkp@intel.com>

[+to Madhavan, Michael; seems unlikely that 79752653c136 ("PCI:
cadence: Fix host/endpoint dependencies for cadence-plat driver")
would cause this]

On Tue, Aug 11, 2026 at 07:40:11PM +0800, kernel test robot wrote:
> Hi Aksh,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6b8c8af514d739d0335f5579b585e02babe8a727
> commit: 79752653c136493ae8c3b4260f9f80de0b91d0bf [13060/13846] PCI: cadence: Fix host/endpoint dependencies for cadence-plat driver
> config: powerpc-randconfig-r133-20260811 (https://download.01.org/0day-ci/archive/20260811/202608111848.Kv74vVhw-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608111848.Kv74vVhw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608111848.Kv74vVhw-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/powerpc/boot/decompress.c:132:8: error: call to undeclared function '__decompress'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      132 |         ret = __decompress(inbuf, input_size, NULL, flush, outbuf,
>          |               ^
>    1 error generated.
> 
> 
> vim +/__decompress +132 arch/powerpc/boot/decompress.c
> 
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22   97  
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22   98  /**
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22   99   * partial_decompress - decompresses part or all of a compressed buffer
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  100   * @inbuf:       input buffer
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  101   * @input_size:  length of the input buffer
> 930a77c3ad79c3 Zhang Jianhua     2021-05-10  102   * @outbuf:      output buffer
> 930a77c3ad79c3 Zhang Jianhua     2021-05-10  103   * @output_size: length of the output buffer
> 6efc2f1a64ef62 Yang Li           2024-04-08  104   * @_skip:       number of output bytes to ignore
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  105   *
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  106   * This function takes compressed data from inbuf, decompresses and write it to
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  107   * outbuf. Once output_size bytes are written to the output buffer, or the
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  108   * stream is exhausted the function will return the number of bytes that were
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  109   * decompressed. Otherwise it will return whatever error code the decompressor
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  110   * reported (NB: This is specific to each decompressor type).
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  111   *
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  112   * The skip functionality is mainly there so the program and discover
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  113   * the size of the compressed image so that it can ask firmware (if present)
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  114   * for an appropriately sized buffer.
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  115   */
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  116  long partial_decompress(void *inbuf, unsigned long input_size,
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  117  	void *outbuf, unsigned long output_size, unsigned long _skip)
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  118  {
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  119  	int ret;
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  120  
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  121  	/*
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  122  	 * The skipped bytes needs to be included in the size of data we want
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  123  	 * to decompress.
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  124  	 */
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  125  	output_size += _skip;
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  126  
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  127  	decompressed_bytes = 0;
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  128  	output_buffer = outbuf;
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  129  	limit = output_size;
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  130  	skip = _skip;
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22  131  
> 1b7898ee276b39 Oliver O'Halloran 2016-09-22 @132  	ret = __decompress(inbuf, input_size, NULL, flush, outbuf,
> 
> :::::: The code at line 132 was first introduced by commit
> :::::: 1b7898ee276b39e54d870dc4ef3374f663d0b426 powerpc/boot: Use the pre-boot decompression API
> 
> :::::: TO: Oliver O'Halloran <oohall@gmail.com>
> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
