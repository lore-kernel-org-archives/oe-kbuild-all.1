Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3EC13C9AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711750620; cv=none; b=NZ0uB6ALEQXqRq5MnvItDSx8Mance4b7w9VZLlaj19IAOuH3wBLvxOGgZfUdaaaWSFI5NDgFowHm69Kqzj63t0N03x+ww67nzJskwxENBnAdbxavhl0r8UolF9KhNSLmRHSPErMSkxmul6V6qd8gVcnJsqCk7wEVSobq9uLeHNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711750620; c=relaxed/simple;
	bh=iZv0j6t6Lga/eXvcEE/d2R52mnUt7+4NVy5w3ZpHZzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFxYRMSSVNFq87yQFRsNJpHaxu2y3cwVeBIq9zsvCvO4LUXLZ5+DpkxpGkK5IfjqTk52i/vDTdHt5Oxt/2MMM+UFHCFxWeCbUzkte1Kb6l+Pts/cmuE4hHrIp9Gqhm7B/uuIUDudjDtKheNt7nD00KKB8oZHgpSlRaG26zSfTUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rD5VuI68; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rD5VuI68"
Date: Fri, 29 Mar 2024 18:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1711750615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBOVDYfShto2J4n29ZrfXDkmY+2t5MMCGeRcYvKAsRk=;
	b=rD5VuI68UlNvmUYsxdQdih2vNy7Xy5fmr0VS6xRq0vSYQkfMWM8H3huTN4qMPD263KyAwJ
	3Objqg/L34e9RNi/oMJuMCGDUTxuqo7MBF+oPOD8tDngWyEPfH1eG3+sQyz5DmmHGLVm7+
	ZtHQq4NeXTXiAUnO8MV7EsEU58RyeMc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [bcachefs:bcachefs-testing 174/177] fs/bcachefs/error.c:360:1-7:
 preceding lock on line 227 (fwd)
Message-ID: <xqdtx4h2vo6zpefemastzv754s4lheufqjl5lzzvmt6zxyvpuo@pfrvzhaljm77>
References: <98178839-fcdc-b1b2-4228-a6f372c39e86@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98178839-fcdc-b1b2-4228-a6f372c39e86@inria.fr>
X-Migadu-Flow: FLOW_OUT

On Fri, Mar 29, 2024 at 06:34:51AM -0400, Julia Lawall wrote:
> Hello,
> 
> Line 245 is missing an unlock.
> 
> julia

Thanks!
