Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9497621
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206170; cv=none; b=JYNG6IMSnHW03rTNRWDjVyFzGv2VyMDBLo4DdHWNz/axNn2HAIOWeNiJhUnQq8WOCvqsEv6sGPwaSZ+Fz0mHvR0fZa3OM5Mad4uFgtkdrTZm/09WG5uCI4g16tcKSYBlfX4/nZV2+FBMNZZxdMrSZEoWElSc6VBYdvvc0YhB2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206170; c=relaxed/simple;
	bh=KrZZZ04SywPj0uxX7d+Eu6p3NxbdhYF8mRIItuEPdnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqasK0oM0ZRLVAKBCn138G9XNhYTPt6q2Mbr8Oq2mtCFRK05Xk1d0Ju2qIq24TASmET/RtYqFeRq6PcU0kVYMPCcWWU+QPwu3K4HJymJPcvSw1e74pa0ltT/r0Coz9OsTb11wP3NqjOn70VSFXa7AhegVmxo919gF6QSoJxIN5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJTys+jQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJTys+jQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF06C4CECD;
	Tue, 29 Oct 2024 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206170;
	bh=KrZZZ04SywPj0uxX7d+Eu6p3NxbdhYF8mRIItuEPdnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJTys+jQs3+oUbaY7144J1bzOPG1UB/dBRvtbH5f9+trCJWnyN+g0Q3Q2Wdr+4KEy
	 tYnIuEY/he2eeqJlqgwT3g49dssjxBUBZJSlGTOiRlCDKyfbQrd7G+FicvOiRvgxSf
	 1LDOXBr5+e86IbdAKbvw0jq0HN5HgpCdxboBblsHaLwyhP18Vht84aR1tPkfChTkWa
	 /cidWiJ5y0lAGDtfTzgRuJGHWlmrm2nvqDA3GIBGvocrrOSGOu1MZmz6XZzuAL90/m
	 0TcIbu5x17gCNpHjyoltFyu927rI9rBZo1k4aT+IcpzgBWkp73LtERBoFKnj9mYbtE
	 01q1w8To9OIIQ==
Date: Tue, 29 Oct 2024 12:49:26 +0000
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master 7404/7771] drivers/perf/arm_pmuv3.c:779:17:
 error: implicit declaration of function 'write_pmuacr'; did you mean
 'write_pmcr'?
Message-ID: <20241029124925.GB4241@willie-the-truck>
References: <202410291954.NiHLIwSC-lkp@intel.com>
 <CAL_JsqJVoxDcLsz5xaNZ=qGRqKoQ965qzv0XwxToFASEJo9a1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJVoxDcLsz5xaNZ=qGRqKoQ965qzv0XwxToFASEJo9a1w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Oct 29, 2024 at 07:09:31AM -0500, Rob Herring wrote:
> On Tue, Oct 29, 2024 at 6:37 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   6fb2fa9805c501d9ade047fc511961f3273cdcb5
> > commit: 0bbff9ed81654d5f06bfca484681756ee407f924 [7404/7771] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control
> > config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241029/202410291954.NiHLIwSC-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291954.NiHLIwSC-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410291954.NiHLIwSC-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> 
> Sigh. Fix posted here:
> 
> https://lore.kernel.org/all/20241029120602.4061566-2-robh@kernel.org/

Cheers, Rob!

Will
