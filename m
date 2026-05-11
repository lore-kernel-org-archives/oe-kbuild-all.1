Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46EA3D8117
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495980; cv=none; b=GjR1elMkJA4SBlyRsajh1DAcMJuY1Ko/ewk4Vk9dKNtRJ4+PdtdrP7KOVUZbQttkmXA76F88y7eQdGHALh4kuk0kYj2msxhc2ep1bREWIzr+RjzITdyqInSYHOXSzpnLGOwTBFTAfB2VGcHlanpGnA11GZZ8698r3rCX8FvMJqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495980; c=relaxed/simple;
	bh=oVZMc0HE/IEzveJJKkcJ32kJzy3S71EaIiVRzxpDjRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjQZVPK47TdSfh6Ft/crWAp2a/1QnAViSPWJxTqh9AmAVZEeEErf8idh/inKSMHyaQtjtFRvCo2PNdxw0ifk9WZFtYj+q4pi/FFx1wkZEMJBRoGdb1o20YTytUdEms5nebgel7oAFipNThxdEsHdiPjwQfhGa3vLHUt569KmCgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFZuYcv6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFZuYcv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65D5C2BCB0;
	Mon, 11 May 2026 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778495980;
	bh=oVZMc0HE/IEzveJJKkcJ32kJzy3S71EaIiVRzxpDjRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFZuYcv6yn+1J3G1i/aHCs66jzsaDSKg+/JYnGTmrsNMkozJVViU4WBNdqCd/IIm3
	 yQxOYLUbLndO32rkSJm0Y0a0BGBlKi2l5yvKJhnkAIbEbll4LBluv6T7O5zlPCdRpu
	 f1zjojGdALhCrkLIOFG4/gJ5P0pboGr/a9GWE6iS8siFj9NSxKhTcYH1zfn5shwBfg
	 rwRZq2RV8bYFnHJSWkd/O6dW7thSxkAO39oY8mggat5M5Fn289Z/5K4DfLnMxi4WT+
	 QlR5C62kGcFK9LRCNDiBlmlz0JD/ycXnxbwrAxhnuu61XHEYU/9O0uNLzyZd1B3ogP
	 1XwYzXPo1uYAw==
Date: Mon, 11 May 2026 12:39:36 +0200
From: Christian Brauner <brauner@kernel.org>
To: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>, Jeff Layton <jlayton@kernel.org>, 
	Aleksa Sarai <aleksa@amutable.com>
Subject: Re: fs/smb/client/dir.c:248:33: error: label 'out' used but not
 defined
Message-ID: <20260511-bankraub-verabreden-a30af54baf54@brauner>
References: <202605020512.8DNwzYZU-lkp@intel.com>
 <CAFfO_h5jg7oOmaE=7ptW1q-ENFmvBH=h3BsV9nmC1UFe7x3uBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFfO_h5jg7oOmaE=7ptW1q-ENFmvBH=h3BsV9nmC1UFe7x3uBw@mail.gmail.com>

On Sat, May 02, 2026 at 01:15:37PM +0600, Dorjoy Chowdhury wrote:
> On Sat, May 2, 2026 at 4:04 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://github.com/brauner/linux.git vfs-7.2.openat.regular
> > head:   be7728badbd230f1ee7beba4162383fa022ae767
> > commit: 93306cec35846eebf467d63a775fa711d7106b2e openat2: new OPENAT2_REGULAR flag support
> > date:   2 weeks ago
> > config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260502/202605020512.8DNwzYZU-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020512.8DNwzYZU-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605020512.8DNwzYZU-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    fs/smb/client/dir.c: In function '__cifs_do_create':
> > >> fs/smb/client/dir.c:248:33: error: label 'out' used but not defined
> >      248 |                                 goto out;
> >          |                                 ^~~~
> >
> 
> This looks like it came from rebasing and should be fixed if we just
> do "return -EFTYPE" instead of assigning the error code to rc and
> doing goto out (similar to S_ISDIR handling below it).

Fixed already, thanks!
