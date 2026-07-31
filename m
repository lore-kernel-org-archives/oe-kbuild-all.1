Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF6B3E6394
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508562; cv=none; b=OncpBIDix5kJIoO9JLuRHBtZWm3HMUnoiWQgg1eRwpDsVyulg0Qdzahca+OtFFih2ZzaTkc+yT2VxqFiGSG2SVSC2ISQpY12vsU+sl9GCSD/h+aX5Zy8e8BtxtxrzEdJ3q/O22FaSIE8JOFOrDQ27GygExav5CxjbE5AaD9phBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508562; c=relaxed/simple;
	bh=Cov8Lg0TfG18yds2x09ps4wHxWN6NhsEdhAlENnU7Kc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pQyknNa1nb3X4wDbW8KvZGQMI0A32uoTg/DUQIYlEJhVagP1MuIav9lCd/xS47RTN5SCD+zuFyJQk3O8yHvsczz0qQoIgfQ6pahfciVFMaCEcP0FkTVQDAnw+kQQW1Yg5XUc1C7307GniC+PYxqPKs20Y8vEbNnX5rpew7PV2mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMhl3TFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMhl3TFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779091F00A3D;
	Fri, 31 Jul 2026 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785508560;
	bh=R2EnRU2XbMdOzBxANCEtGrh8v+oqT4U2Kjm8UB6xdmk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=oMhl3TFfjOwUhNQQYOi7lZ5fVUATQeaIsCUvQcWE6rT28kz75wq90VOXFkOzkJ5DE
	 4k//VQaQXy+4MEDmi4M5ZZCWsLt7kFpvVJsNa6JbfrQA8Zilt10DookhA60qzADV3H
	 GakMEkurzorI9oTyxMZXb5Y2zlxYJxvVtJtyO96wcjazR2BtNJPxmQrfk1fbs6EM0t
	 B+hkJedXUPUrjlTi81REwK8h04qwL6oZFZhFNl1O79qZMMJf67uch6Tdk6qkusNUl6
	 fjTYGnA9hC9/HO+vQW0HnD9qgs9vtiH3K/NBkRy882Hve//NixITcz3QqSqDzyjQIW
	 zsnUIHicgwmNQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 507A7F4006B;
	Fri, 31 Jul 2026 10:35:59 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jul 2026 10:35:59 -0400
X-ME-Sender: <xms:z7JsajVxBbrtE5HcAgzd6cmoQIyGtfb4dyx3jDaY2iWwUAciY1qCfw>
    <xme:z7JsamalcUb7rAKBbgPprLeayRUsr347HnFrXEPTgzYLzQdyZIdjKy5oBikRA6JiK
    xcfVpcryc0zs5ti3sSIVfNC72QyiZIsPhhBVZKO3Nuxz4JmRJoab44y>
X-ME-Proxy-Cause: dmFkZTGZKOa5CEXnJ+eG1P+bpQHDlEvNb2lwIx2GuA7P7SS/z1uxLZhR42zW4lXpBioikK
    4L3Vu2rrMAFx3yzj8Oq6LlfPHonOzDoK7AbL33dFq6qjqZ4aEnFEVB0q1Qf7oszV+8bxpr
    YSyzqwt3XD37qmXLM/6hbPOiy+sU52qIm6s5RJGHBFo1LejqdjB+imzd0velNxpC/YNLZ2
    AygOhLb3FLkb7SF9sKMGBkyQUGtrJDdmJCBOW668VYqaKLA7DlWK+u1Mq2h4hKelU7QCxI
    M0Z75S4novziiAsRSH5bCe+e64lKPdLhMFNdPF1qYbuHaKvETfirCwzF3u3CmVeROM7yTZ
    5rZYuoCBgHC0dLWYMJIWlLY9a8a/0/Jaxd+TUTkcOMEqPIJISuVscgjzo5C6w72+x0SZFa
    2EvYyHoRt7KeOKJZyHS8KI3KIw0tuWNmMvH52m3H6x7dbXC8QjuLxhYainISEf5EiclkM/
    eFIoHLOhwLnDPmEBFma8AfGm9FysT/E2w/Uw/hM2xffTgPTmomwbU1ie/1QAwTDR7JyWYr
    EO6I1SMA3JUBI1lany+tihqZomvK1aDbueYkP8zNbAa3hQl60aWPN1+ww1DpPfCeY6tA+1
    EFBmmUWWaG0+kSVyRPUxbDsBUTiDwIw2qYc+loneIvfj7N6C7+6VT6nCxuxA
X-ME-Proxy: <xmx:z7JsaiQaVfAWZwpZl3Q7rtNMg_qHGjgiWjW-sLGveOWD_LHae5joEA>
    <xmx:z7Jsavj8sgMBZMybXc3MmjG0MBJFmVywzk5hRMfViG4tq7JkFOP9-g>
    <xmx:z7Jsai4BfhGVh_d-FPhSrwmRJKesUz2Dz8GB-X3hZF7Nkiau-28AJg>
    <xmx:z7JsasBVr6wH3uoUAV89O9ySTccINy1ihjodwGJ-jV1QeZRUraZXag>
    <xmx:z7JsapYMhQgWzbtp38nOKXb146UZcMYLugMNCo4EUsvpZnGLQIf179cx>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2FE8A780070; Fri, 31 Jul 2026 10:35:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ARZpCn6pkYu3
Date: Fri, 31 Jul 2026 10:35:39 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Jeff Layton" <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "kernel test robot" <lkp@intel.com>
Message-Id: <c79b1736-efbf-4e0d-ac8f-15fe113778d5@app.fastmail.com>
In-Reply-To: <202607310455.AT0GoC5j-lkp@intel.com>
References: <202607310455.AT0GoC5j-lkp@intel.com>
Subject: Re: [cel:nfsd-testing 110/222] fs/nfsd/nfs4xdr.c:4200:18: sparse: sparse:
 incorrect type in assignment (different base types)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Jul 30, 2026, at 4:37 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux 
> nfsd-testing
> head:   67be65963a6470b667125cc648b56161ed3dfdce
> commit: 4b64b811f368bcd98a5a11f7079f863db3a2e1c5 [110/222] nfsd: add 
> notification handlers for dir events
> config: m68k-randconfig-r122-20260730 
> (https://download.01.org/0day-ci/archive/20260731/202607310455.AT0GoC5j-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20260731/202607310455.AT0GoC5j-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202607310455.AT0GoC5j-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> fs/nfsd/nfs4xdr.c:4200:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] *attrmask @@     got restricted __be32 [usertype] * @@
>    fs/nfsd/nfs4xdr.c:4200:18: sparse:     expected unsigned int 
> [usertype] *attrmask
>    fs/nfsd/nfs4xdr.c:4200:18: sparse:     got restricted __be32 
> [usertype] *
>
> vim +4200 fs/nfsd/nfs4xdr.c
>
>   4191	
>   4192	static bool
>   4193	nfsd4_setup_notify_entry4(struct notify_entry4 *ne, struct 
> xdr_stream *xdr,
>   4194				  struct dentry *dentry, struct nfs4_delegation *dp,
>   4195				  struct nfsd_file *nf, char *name, u32 namelen)
>   4196	{
>   4197		uint32_t *attrmask;
>   4198	
>   4199		/* Reserve space for attrmask */
>> 4200		attrmask = xdr_reserve_space(xdr, 3 * sizeof(uint32_t));
>   4201		if (!attrmask)
>   4202			return false;
>   4203	
>   4204		ne->ne_file.data = name;
>   4205		ne->ne_file.len = namelen;
>   4206		ne->ne_attrs.attrmask.element = attrmask;
>   4207	
>   4208		attrmask[0] = 0;
>   4209		attrmask[1] = 0;
>   4210		attrmask[2] = 0;
>   4211		ne->ne_attrs.attr_vals.data = NULL;
>   4212		ne->ne_attrs.attr_vals.len = 0;
>   4213		ne->ne_attrs.attrmask.count = 1;
>   4214		return true;
>   4215	}
>   4216	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Jeff, I actually can't tell how to fix this.

The obvious problem is that xdr_reserve_space() returns a
__be32 * not a uint32_t * ... then the code sets the values
of the attribute mask, in an XDR buffer, to host-endian
zeroes instead of network-endian zeroes. (equivalent but
not semantically the same). If the attrmask.count is 1,
why set three bitmask4 entries? Or is this reserving
buffer space for more than just the bitmask4 ?


-- 
Chuck Lever
