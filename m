Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B7633F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726535930; cv=none; b=UB4sgJWGjp3K4NAgzgwzQrUeIpecR1CY2lTWfYArYSSvIznMTPKf/VtzL0YA9udWYcUqcRzKSB33sIaiEEPXqXXjyci3IxjALoLo1raR6iiFEMxpppt/60pipIYXSaUQY4ckYQ1fl6C2WJMpO81OjaxWVqK+9Ld6i3QeNA4pvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726535930; c=relaxed/simple;
	bh=RBnIqXxtPTtmFvs3v06RDoTqpkDvWNzY6S8DmSAXAfw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R7j4VXkWNI9ESdDykfRMvjUMrl6Y7sa9fqKKDJBkKodjvMTpsXYYkGhd1Pp4gSpceDPBFGZsmk+q0wYL3CvjRA7Pepkz5aP2Y2ZbToZtnZSHtuHeOP7u6yqv2tMZDZExyHdQkNBrlzhOPT6yQ9pJXhhwoLtikqVg76UYWxE14c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=R1avpu4a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="R1avpu4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726535922;
	bh=8PxUovWawpGvdmupDz3IC0VNUjJJjlkRK+3NFfTKFVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R1avpu4a3mPGJisusWycWfjTE0F6Hnyrb7M9cNfWzwMzJ2BWPl9iRLsDrTUb+S5dY
	 CkWJTW23lp0ZMhgCVZeYi9rMnvYqjw9C+Z5L+P7Dp/ZhnE4pl51UN/3Rzu7rU46f/i
	 jwXMnonmixZCxkJD2NTRMo2p2Bkd/qia9CFmdv3wvQxtY8+XKD2KIVcg3+PUkwctn3
	 nA4YSuy5ZBULAOYFkEvA0Ink5weLQ2PwDN8EqLvAfkX0Y73/KySyWWTf+X9eGN7k/A
	 6/nzkAN4Y3q7bpLwcPwNP4sKT685vx9fMpAPCuFUA3Ngi4ZkZaB44Lc0ieqPIMygYp
	 Po8f7H6jilFFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X73nt2jzlz4xZ7;
	Tue, 17 Sep 2024 11:18:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: kernel test robot <lkp@intel.com>, Narayana Murty N
 <nnmlinux@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [linux-next:master 10289/12187] eeh_pseries.c:undefined
 reference to `eeh_pe_inject_mmio_error'
In-Reply-To: <202409170509.VWC6jadC-lkp@intel.com>
References: <202409170509.VWC6jadC-lkp@intel.com>
Date: Tue, 17 Sep 2024 11:18:38 +1000
Message-ID: <87ed5jqdqp.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7083504315d64199a329de322fce989e1e10f4f7
> commit: b0e2b828dfca645a228f8c89d12fbc2baecfb7ea [10289/12187] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
> config: powerpc64-randconfig-003-20231031 (https://download.01.org/0day-ci/archive/20240917/202409170509.VWC6jadC-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170509.VWC6jadC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409170509.VWC6jadC-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    powerpc64-linux-ld: arch/powerpc/platforms/pseries/eeh_pseries.o: in function `pseries_eeh_err_inject':
>>> eeh_pseries.c:(.text+0x9d0): undefined reference to `eeh_pe_inject_mmio_error'

Cause by CONFIG_DEBUG_FS=n.

Looks like eeh_debugfs_break_device() needs to be moved out of the
#ifdef CONFIG_DEBUG_FS block, and renamed.

cheers
