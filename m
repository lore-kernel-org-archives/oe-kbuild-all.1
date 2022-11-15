Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B928DBA4C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 15:58:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A93B03200928;
	Tue, 15 Nov 2022 10:58:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 15 Nov 2022 10:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1668527885; x=1668614285; bh=Yt
	mPYJH+3NB2X9whuY4EvN/qQZLq+JqRriE20y2qXUQ=; b=iZmfaeMMYftnv2gJXb
	MtfjS+vsWXltd2sl3z97lcY0pWWoejmWPpwzbie48tu5TGFM7ckNCN1r+BSKdwSL
	wilyOKgKj5VFi2dGG3TC8gDppr+FUdO4HHwQblHTCbQJ9a69THJUoyrUhjq274GL
	TjWWF6or+Fn2YeaZOHJ0sektam0yYdW2zaD3V0ZIfI4/RzXu/YLjyONqdl7Y1xXv
	wXVYgu1iJPcH2Pw1oiYxrmx/O08nRMPNjL9TZX50upu03A2HItK/6ZL3Blz7TrH6
	AKGHVJ3lnYiceH0fp4YevNHjCpz8HIOG0hX/yBPFjgz2D4y/Jw9GI/c5B7rCaBKh
	Rz5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668527885; x=1668614285; bh=YtmPYJH+3NB2X9whuY4EvN/qQZLq
	+JqRriE20y2qXUQ=; b=FgyXfNsj5B+Mkm1siFldGp4pzOfYkdf6Rd03cR+2FATT
	hYrMJNtB7xwbAPPPE4xy52Pf5lH6DAmGWj3Q1cXYRys0Xa4ZmWSGVMTK+nOeFF0N
	gmXMQk3ctpxMdLKkqY2c+yQ6qJ5NJVoenj7sFtnjvQfhHJCgmDNyxQUbFHNhi2rw
	Ol++JcWIftibqtKxuZrI1rV5D7R/0oFxMksMQ5/mrwonp7Ryhc/DFaZt7DzfOY8D
	8tCrTiEZtErh7OqtYb3Vxxs/RQSU2GLJNcDVsPKwVruB0G2O0GyjEwvplPztua47
	0N91ub+PB4nNxyWeih72nl0N709U4MzD8m4Ln1OqsQ==
X-ME-Sender: <xms:DbdzYyBML0Y7DGI51X7hsRL1PQPO0fJJrqkSBvUxHaITb64r-xIgLA>
    <xme:DbdzY8hF_pWeEvqw0vvHkZtLxgXFdVkfDLfRVkmWH6-7HUgbeAzQeC-jxFTD-dPah
    s1APwjAio4JfuYfAS8>
X-ME-Received: <xmr:DbdzY1m-tQvZaEZjb_KutpnbqFypBXMvwmxb8uzr9RbgsWkGKPa69KuRXKSLlbklOHw8EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttddttddttddvnecuhfhrohhmpedfmfhirhhi
    lhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrdhnrg
    hmvgeqnecuggftrfgrthhtvghrnhephfeigefhtdefhedtfedthefghedutddvueehtedt
    tdehjeeukeejgeeuiedvkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:DbdzYwxuVTJmVUdwgSBDJShBrqBwvBlfhcmm-4JYFCWiZuw6tSJBlQ>
    <xmx:DbdzY3Rnkka-orLcg-n9y0-8Im3vy65ZvgZjOScQT8l7bqkhbo8ihg>
    <xmx:DbdzY7bgHg2pRssMHDyDYMhWSWJschPFwqR8PR0kFQLmHzbpCZAq0g>
    <xmx:DbdzYwTSJKO6WqYF-GJX1dFRoKS5opeAWhxtUxs2VJcykQ28i1BtwQ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 10:58:04 -0500 (EST)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 5570C10997B; Tue, 15 Nov 2022 18:58:02 +0300 (+03)
Date: Tue, 15 Nov 2022 18:58:02 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Dave Hansen <dave.hansen@intel.com>
Cc: kernel test robot <lkp@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [tip:x86/mm 5/16] sound/core/hwdep.c:243:24: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <20221115155802.p3vjnk7eqqcyskt3@box.shutemov.name>
References: <202211150551.T7mpZomP-lkp@intel.com>
 <fdae3de9-db03-b04d-1992-bc8efd053053@intel.com>
 <20221115034007.go64rirsoqazpks7@box.shutemov.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115034007.go64rirsoqazpks7@box.shutemov.name>

On Tue, Nov 15, 2022 at 06:40:07AM +0300, Kirill A. Shutemov wrote:
> I also looked again at get_user() and put_user() and I think we can
> simplify them. The variable just adds noise.

I just realized that this is not only cleanup, but also fixes sparse
warnings.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
