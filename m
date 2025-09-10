Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EBA31AF33
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510987; cv=none; b=KEftYMIpwpiU5px052UmFTgu5va21tsDLSD4flNuzTPLtGcGFKNDEk2Xb7xYSX8UDNB/LltuHJMJO0sOpRI/QoerYn6zAR21A/t4o0PlNjAulHTc4GReCh3xEW/ysWvTX3qdoS9XIFHqNL5/0oEAyy1O30X2AVYq733Dg5FJfxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510987; c=relaxed/simple;
	bh=xH+i6/5I5ZBpVbSk5ltETC/lLwr4zxOeT6T7d6S7fzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njCqmUXA4bWuZhpMunHg5dVai9aOSbNfGgpatAhKpOvrHLHTtVlPPEV8Jo9xZIIFgt1V44VQ75f51A/W59jIm5xDERUPNbQ4QLieXPzI80f0mPahdZzMQAGUZbrF26r31E9QvTUtbouCd3ivEvVFtJ9O7h+VNaquNK3fnexzLqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=XzR4y1qn; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="XzR4y1qn"
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 7951440EA01A;
	Wed, 10 Sep 2025 09:29:44 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1757510978; x=
	1759325379; bh=xH+i6/5I5ZBpVbSk5ltETC/lLwr4zxOeT6T7d6S7fzo=; b=X
	zR4y1qnJUXbovvZX6a8yFEt3Yn0ojQX63wAyo5bJan2z/j8skScudMncQDrL+0A1
	IiU7cEOhM1IKR+fFhSIVf0nhrRhi7dHzruZCTKwb6jfs/YjwMh/qGe6dq+j3gLdH
	rLpP3V5+lrSz+X6ZUbqGKD/88lmbJsua2HAG/XYMTg=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id r-HOzhL03qOY; Wed, 10 Sep 2025 09:29:38 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id D32A540DFF6E;
	Wed, 10 Sep 2025 09:29:37 -0400 (EDT)
Date: Wed, 10 Sep 2025 09:29:36 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
Message-ID: <aMF9QFIvXC5kI_9J@ada.csh.rit.edu>
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu>
 <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
 <CAMRc=McBdJ16RYvJM_R7pL+u3zcs_+A0nj5_5twP7KxWhW6VDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McBdJ16RYvJM_R7pL+u3zcs_+A0nj5_5twP7KxWhW6VDw@mail.gmail.com>

On Wed, Sep 10, 2025 at 03:15:46PM +0200, Bartosz Golaszewski wrote:
> I cannot really give you much feedback because this patch should be
> first split into smaller chunks that explain what each change is
> doing. As it is: it's so complex, I simply don't understand it and
> don't have enough time to try and decipher it. Please try to make it
> into a series of smaller patches.

Got it. That's why I offered to break it up.

Here's the order I did the work in:
1. Add quirk support + brik quirk
2. Label format (Only a few lines, could go into 1 or 3 if preferred)
3. RCU stuff

Is this a reasonable order for the series? This would be the easiest
way for me to do it given what I have in git.

In a perfect world, I would like to have had:

1. RCU stuff (These are effectively bugfixes)
2. Label stuff
3. Quirks
4. Brik quirk (possibly squashed into 3)

Let me know what you think... Thank you!
