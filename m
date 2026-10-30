Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373408;
	b=TF0prUfxra6K2Az04KBQlLof35kj+bx9pyjnm4Ewy+QXO8K4bk4AyaKufHQwFnXD6lRd
	 UtyVnk8I2ePsWq9CPAHM3oHV5hO4uk1Yl61OZtpAfyCOYqGpEvqKsuOlZ1+5S1R7/+6vw
	 15B7H/zpSPwMxYezDDeNEHqByRZYo3Tzgeh6TOwbI2n8VHvMK+YjooinuNT57DVO5z0l2
	 8DBW/Wiubfz5soHdUw3CC7n6W8rvI62qKg+EHfGtQbx8Yz3fOPPL5PqdtVbqdn+1EXLpJ
	 qIsDxBfZfagooJinubkWYjDzNZA+8GuFFn3lwmbMuKu4Vqgh+bls5inNdDJDByIfBLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373408;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NtHSbQEtrW/bpiqDFqsPFvd7laFoSl/vTklJe3mAuGc=;
	b=CZoyNV+0Czeyuy3IDnIZ/CgzAKmmx6kS5MXNXFdYU3190jpeQbnVCu1tiSl4LCPZhcaY
	 7Yp5IYM3ndzmgsPBBjcdSJV4BYhRNTetqj8FA0mjzpn4aJkB+hYOqQALyvCicOpsXJHWf
	 7gTukhsHGYL1sVRw44/vDHv7LaVa0+eIJN/0JTsc5OX/bNUWiWeiNjvn4jOXSHt1EW3pv
	 xGWI2lOed4QMsu8gqIJUMOTM8njbfRZlSFd/6Qm2Pli1TeaJF28j4ABySfYtYqs827ZWU
	 LGR0mCDtQOotyMwmE7DWP3nqWSJ2dd36k2482V+OhlwIOnA1TGRCBxTBoQgL4Wr0a2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kC/3nk82";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 92AF2606A32A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kC/3nk82
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B70001F00A18;
	Fri, 30 Oct 2026 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373408;
	bh=NtHSbQEtrW/bpiqDFqsPFvd7laFoSl/vTklJe3mAuGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kC/3nk82DlsDzEZeA3qtw1M2O+YrH5yZBYVUKzXgpSSPIuYokP7zZDjZCteW1nhS3
	 fsiwx2XcvNe/g+Dirx8oQI0ufYh2ZY7S9D67rWpyCeaNtBsRcB+uqDrxme0iTcGnn3
	 IkMj1EbJ8L659gEVbpgO8xwbN1aTayxe2dEGA0qc333KxIPVViIILEbD3ruNY9LuK2
	 S2YAFVrHilCtmPmLcWRYwOmZDZcxShPsZN9JcWtMFfNh2CzUY48vOoO8a+C0HbiIqe
	 6h7ztyV1ag462geTAwIGcJe5huzX0jxGHet2xk8PFPmrDjvYKpwadNipyF5wvPMqOm
	 OA+SInW8QAfqA==
Date: Fri, 30 Oct 2026 17:16:41 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [jarkko-tpmdd:master 12/12]
 drivers/char/tpm/tpm_tis_i2c.c:243:12: error: use of undeclared identifier
 'TPM_I2C_BUFSIZE'
Message-ID: <auS0zLidW9aqW9Bi@kernel.org>
References: <202610300451.H7bYZx2r-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610300451.H7bYZx2r-lkp@intel.com>

On Fri, Oct 30, 2026 at 05:02:35AM +0100, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
 
> >> drivers/char/tpm/tpm_tis_i2c.c:243:12: error: use of undeclared identifier 'TPM_I2C_BUFSIZE'
>      243 |         if (len > TPM_I2C_BUFSIZE - 1)
>          |                   ^
>    drivers/char/tpm/tpm_tis_i2c.c:352:40: error: use of undeclared identifier 'TPM_I2C_BUFSIZE'
>      352 |         phy->io_buf = devm_kzalloc(&dev->dev, TPM_I2C_BUFSIZE, GFP_KERNEL);
>          |                                               ^
OK this my fault. I was sorting merge coflicts an so it happened.

I will fix my master within someh hours.

Br, Jarkko
