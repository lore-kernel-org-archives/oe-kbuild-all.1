Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808C27A122
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 16:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975746; cv=none; b=u/s549lQqPBJQC8JuOMeSWzuEqr6FarmRdELV+FDP/dREfnqpUiTDAtwGdHsYu3EuNk0nA2+SB98kjJbYZxhgUIs+IZ678qHTHToZsbNsF/XZigufM3hFPs1NKzSePvgqSBqREw9bIdWaKNUaIhhLesCT/L6J0P9RBR7mD0ExBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975746; c=relaxed/simple;
	bh=Ly5rsu9iAyn9lW0IFWV/1YmnCBk3D0LSGmuBOF+470I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bawCKuO0WBjSPE9PanY2uJJFUucA/TJyEWF+wBBZSxRr1b7+oQ12kBkBri5ghXIY+ekKUWHjnRTD5KeAeQr+U/95c386aEgAsD6uHjblKdxggHiF19EsknbbFFDZ4WnTc+MOJdlyLv6yA6i/qvR6H/zlEPvC1lnmIpy8WDhRlLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp6zpKd+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp6zpKd+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D373C4CEF1;
	Fri,  9 Jan 2026 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767975746;
	bh=Ly5rsu9iAyn9lW0IFWV/1YmnCBk3D0LSGmuBOF+470I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=kp6zpKd+Le+FlxEkkb0lIwlDXyO3zbz+qGxAgdrwblE6+eSaebxkz3JFeNI8thkWx
	 ZWkOmjHAruLbDEz53ggeUo2zqzG+N9XC8+EXtLjoc5ARcPFyOTPupkWQht/tNSNTXA
	 FhclIOxgVyqpCRSew9fq3uTLPWvBAmIW23L08clUReZJK0DSefSJozBur+3P8vb7W9
	 9oWjpItm2awRrZjMDC0LHtr6P+Mif3/SYCI8d1saq0bnzqrma4xfM+Cs5y5guD49xy
	 H89h7bAHbkecmNJ2G4XSD32LNkJoM+qtqtcOcJJohTTH5KjA4oJXDBp69coq/wVmje
	 VohysB/Z0MLVA==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 17:22:23 +0100
Message-Id: <DFK73G5XKCEW.3IE3GE9726PDQ@kernel.org>
Subject: Re: [PATCH] drm/gpuvm: fix name in kernel doc of
 drm_gpuvm_bo_obtain_locked()
Cc: <lkp@intel.com>, <bbrezillon@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <oe-kbuild-all@lists.linux.dev>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <202601091113.0b0WuRML-lkp@intel.com>
 <20260109082019.3999814-1-aliceryhl@google.com>
In-Reply-To: <20260109082019.3999814-1-aliceryhl@google.com>

On Fri Jan 9, 2026 at 9:20 AM CET, Alice Ryhl wrote:
> When renaming this function, the name in the docs was not updated. This
> causes a KernelDoc warning. Thus, fix it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601091113.0b0WuRML-lkp@i=
ntel.com/
> Fixes: 9bf4ca1e699c ("drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and =
staged mode")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-misc-next, thanks!

> ---
> Does anyone know what the config option to enable these warnings in my
> own build is?

I think any of the documentation targets should do the trick, I usually use=
 the
htmldocs make target.
