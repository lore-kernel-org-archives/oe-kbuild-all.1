Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4463DB629
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763470; cv=none; b=kBfeEgLB7525xkC7ktOfHaAgOVAkrfglfJckVsr8JhJKFzaN1aJhOdJKTGZS9ZraSpaDImQEu+Xal0E5Wbc2SKBoQGsoavx9jYKD2aVBl5nmkrvZTxSuXpxtK+4qd33rnReCAq0sTcEgH45zFKqN9KjmnQIcXcC7rGW2GDHK3Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763470; c=relaxed/simple;
	bh=EVm5avc8lDAlipQhlTcKa8uJDMq6tClkPzBB0/dLxWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFh7LpZtuoNj6pPvSiSdMOyOOEoFNWyyA/NZAVy4Ywd+XrJiUtE6FcLNDisqwo3qSy2NQRlsq/qdjv2B86T22v1+dFtsrEfJqlVUxs7tOxIPD7K+KTBuamCyr8Bx2MUUIErlB0c73xxRjR9PxFmi3nw9uyixUILcHxeZuMLH4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VL3pkcx6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VL3pkcx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835D01F000FF;
	Wed, 30 Sep 2026 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763468;
	bh=sSrN8/kcV8ZporReGb58qeF5zWINHmzHeOu3O2H5VXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VL3pkcx6+PoOopAOD6bPs7ZihiLDbO8u/oMk3XRNSfzo8iJgJ4Vv79yLwNu192VVe
	 4zJusdRiJn8054Mr9dycsrM5lLxdljsMkWkjYp/iLPvenJE17F0Ab42TRqQ5YkbBXW
	 /coVnQJ0ir+lVFwyMiTUIgpHWTGzN/zWQk+wxd2CP4ScEjM9Xah/vI8Xf6CCHb8au3
	 IYe+oYbtYO/pVoLm1wTmQA8ayxbBr6zqLGSxiIh7YwKmbBHV/vcHI8P/+gQWFSNonY
	 2iMrkIRnGuiSqSJCQgTxs2+SWji026PXSkJXAss9Bv1e6W5sw44ANAhvw/3qXZAkMv
	 cOT2MweQvkCog==
Date: Wed, 30 Sep 2026 11:17:44 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: scripts/Kconfig.toolchain:148: syntax error
Message-ID: <arzhVxiGwnCEbym2@gremlin>
References: <202609292015.PFfudTdi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609292015.PFfudTdi-lkp@intel.com>

On Tue, Sep 29, 2026 at 08:19:42PM +0200, kernel test robot wrote:

> >> scripts/Kconfig.toolchain:148: syntax error
>    scripts/Kconfig.toolchain:148: unknown statement "def_string"

This is just the robot not applying the dependencies correctly :) they are
stated in the cover letter.

--
Cheers, Lorenzo
