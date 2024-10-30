Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C6A1F6660
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287725; cv=none; b=U3oK0YmPfpDG5PFUIcTvOivsB7AyIB8NIYdxPzMXu1HXlpUspScecszCPt9w6aEpWrBN3bU+SflbgcuhJpDJ7x+aOaU9/v3G99KyndEwcz+N0fjnqQ/0Np2LhkPy1VrEq6XyW0IjA2gr5vYFf+1mmOJyOc3zkONNCCyAyPruL30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287725; c=relaxed/simple;
	bh=MGdCbeoIIfI0srBcg9AWTVlhhJ/4b54gvMTUc8mKQLA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JMiOIOqS1yBuqQGuvT17wB3tltVfKvlvy4QGzA88g4jSOqxSczu8vY7qSMA033kjXL6LglUp/Pr0whESaFRbl6wY2+qVa8aSH9ExPPtyHMhsriah85HNwkMBbmZDFBpCZ5zDfyCSoIWfz95eWDjCNP2hEFCijmXzCl4I8sGHmd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=u/6VJLcR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AqQJFqYh; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="u/6VJLcR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AqQJFqYh"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8228411401EA;
	Wed, 30 Oct 2024 07:28:40 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 30 Oct 2024 07:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730287720;
	 x=1730374120; bh=YhdUNtgLpwlg0s7fFfw2y8g0iLgCT7JGX061N6SrdjU=; b=
	u/6VJLcRRNo/+OSfY+kpkg/FmR1ARNp93AYbiPfqNiL0ys9ZF9aFi/jdQjisQDg7
	clirLI75K9h/XjPuR/33VyFzT/BXXVEjZfG1wYuLAna4bJLfw5CS4o+mNLsmjZLW
	Myj+yikY5qsqaolTG1VwVEC+jXvBu6Li0BvD52hLJrZWQysys+6DFhHR1YMMXx8a
	ZcdjEDnfG0sgAZxwPOD3G1tr2DY+WWeOYpVN+crVsAz5fjvODaewPMBcdwxamyp4
	QzUw7cQvze7sVRy5BmvjsoyoADcCMaszswO3gI17zPIMJ8gaeowEZ/4F2fmvgZbK
	gdG805KW/fp+0nYwZatX4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730287720; x=
	1730374120; bh=YhdUNtgLpwlg0s7fFfw2y8g0iLgCT7JGX061N6SrdjU=; b=A
	qQJFqYh9Yj/0EUyoycEfGx9/vSFzvVkG5WcDQnWIyvhx9fvnxreI3DmGUqO3hT+Q
	OdmhkkNBFkD4cq05iFJyDAg7Lrro37L2lazu3r0yfoQ5SrF3RS/28KQJ1BrgnOTa
	sWb44fY5quMUnmE4lQ/Ppb6iAKkQbJhE0CefhfeOhJWoPVBmJLdaaLtw8vCbv4I4
	RB8PJDc3XT/oDVA12NBKTIinTyuuZx0cB2WLXCeAJp4RJJfk2V5IpSR6fysd3zbX
	hJ4foCVreDM2sKrnkClwNEWVtGtmm7AQJVFhzUCecyuNVE4G/bEDPTmqVNF8mqYl
	K1pXM794hwxb84Ia7S28g==
X-ME-Sender: <xms:aBgiZ9Qh0E8MX6YnTNEfuWgVcW3BBzxGQOnp8Ni4sbNmX6dhpGchXQ>
    <xme:aBgiZ2z7aEkJaLAOqemmMc-sWyUA-qjvp5JqWoirp1fpxGFgAq96gIQkQV0HMIRUM
    uenfQKKrSOMQbUkGRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehjthhhohhughhhthhonhesghhoohhglhgvrdgtohhmpdhrtghpthhtohephihu
    iihhrghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtohep
    rghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehovg
    dqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:aBgiZy1thvrttlGM_lilHOpH0rUNJwmLC8gShto72M4dKfUO8P36fQ>
    <xmx:aBgiZ1BWsmFNmWDNvzhgb7x4hm0jxf2e1xGDNmH4B9YXvXYvAv2ZlQ>
    <xmx:aBgiZ2hkfgDdPoyNFrAmdqwYlr7c0RHy-eUQscDst0eDWH2avGYe0A>
    <xmx:aBgiZ5rMzAQzy2CvdqdgCeSWpFp4SqYXS92aoH6rpzy8hszpAbxbyw>
    <xmx:aBgiZ4b2WvQUFqbMhVxhCSD6oVcWT1SDE1v1qWnQgiub-kZyURHjm_l6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E48592220071; Wed, 30 Oct 2024 07:28:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 30 Oct 2024 11:28:18 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "James Houghton" <jthoughton@google.com>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "kernel test robot" <lkp@intel.com>, linux-mm@kvack.org,
 oe-kbuild-all@lists.linux.dev, "Yu Zhao" <yuzhao@google.com>
Message-Id: <25faaaf4-d2c3-4dc0-86d4-55dd25568c12@app.fastmail.com>
In-Reply-To: <20241025192106.957236-1-jthoughton@google.com>
References: <202410252141.djLwbAYF-lkp@intel.com>
 <20241025192106.957236-1-jthoughton@google.com>
Subject: Re: [linux-next:pending-fixes 301/373] mm/vmscan.c:3498: undefined reference
 to `pmdp_test_and_clear_young'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 25, 2024, at 19:21, James Houghton wrote:
> Hi Andrew,
>
> The following diff applied to the second patch[1] fixes this error. The
> diff is functionally a no-op; the get_pmd_pfn() immediately following
> the code here would return -1 in the !pmd_present() case.
>
> I can send a brand new patch if you'd prefer.
>
> [1]: 
> https://lore.kernel.org/linux-mm/20241019012940.3656292-3-jthoughton@google.com/

I ran into another problem with the build failure below, and found
that your fixup address this as well.

      Arnd


In file included from <command-line>:
In function 'pmdp_test_and_clear_young',
    inlined from 'walk_pmd_range_locked.constprop.isra' at mm/vmscan.c:3504:8:
include/linux/compiler_types.h:517:45: error: call to '__compiletime_assert_401' declared with attribute error: BUILD_BUG failed
  517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |                                             ^
include/linux/compiler_types.h:498:25: note: in definition of macro '__compiletime_assert'
  498 |                         prefix ## suffix();                             \
      |                         ^~~~~~
include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
  517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
      |                     ^~~~~~~~~~~~~~~~
include/linux/pgtable.h:383:9: note: in expansion of macro 'BUILD_BUG'
  383 |         BUILD_BUG();
      |         ^~~~~~~~~
