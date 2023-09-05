Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5843C1FA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 08:37:25 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31c65820134so1961253f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Sep 2023 01:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693903044; x=1694507844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3RJ/ux6+FmAkrZoWQl+tb6r5rKkNiIf/qsyPnmJWB3E=;
        b=H+Kma5Io4gGBCUEaL0Q0amrHT3PrjccZp5u5nyJLAvhOD5ZCGZCFan1DuTmZ5Ehp2g
         JvvCab67ah4n9d/2PFmwRI541onAgZ7YkXqM0J772KxO2bgMIGEdlNHVaF85B1kdApg4
         im99HkuvRfiozxfR9P/seRvXOQGy7pWfAitW2vdCPn/z7KYRjgUMTVzCFJGNx0gfXg3T
         LGDETlxvKA0wf/iwaEPm3eahgFuodUeHgp3coep+3yoVn1JqK1WxhIjKybQHaWc4iEYK
         Zn9RIvPkKAOpo39x16JUsXQAe7NeL/EKaCrN9vbDJ0SfgSWwGpBSbjteh+UgTe/idVZN
         HTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693903044; x=1694507844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RJ/ux6+FmAkrZoWQl+tb6r5rKkNiIf/qsyPnmJWB3E=;
        b=Khx6XTP9BsQBspoVHD69e0x8UauR5s/A406xKx4N02UJf9LCS07HmpMlV97H+mhFjL
         0MrJkXgegRcpZqMR7xL9t5b+3z2CFNkMZSmwh+JNJO9IGwAkghGnZ6EosLDUf0jHQvkJ
         IQZYauAaw0BLh11cwC9U3rhcy3ybPXo3TvzW2vJY30lKJsqQUIaaeUW7DLr/gW0jQ+eq
         E9y7VRzYrQchyQhgDNSrpbLsknHAvZAT6cjkKqFJl4YJsctc/tETGeuyCeS30Ty8w+5u
         7RH0NAZTxJiAjBCq6/q1Q55IqLZcghuP5sfSbrXRM8V/uG/Uk2p+7AGr3OKXC8zfyOJB
         2Fdg==
X-Gm-Message-State: AOJu0YwYu+XzYRLyjDN6P/E7krsf2koYWTIYMnAOos1h7sY+lW4Kujc3
	i1LWIFhN+0iDCdH/H4Y5qu0NIA==
X-Google-Smtp-Source: AGHT+IGEyrRp6e5Lv9T8OlQ9aISSroEEmss9wCSroKoMINkGqs0GLZh0sCsQtnwopwmpAo3jFxwJKA==
X-Received: by 2002:a5d:58f0:0:b0:31c:8880:5d0f with SMTP id f16-20020a5d58f0000000b0031c88805d0fmr8287482wrd.11.1693903044098;
        Tue, 05 Sep 2023 01:37:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bt9-20020a056000080900b0031c5ce91ad6sm12846702wrb.97.2023.09.05.01.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 01:37:23 -0700 (PDT)
Date: Tue, 5 Sep 2023 11:37:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hugh Dickins <hughd@google.com>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Carlos Maiolino <cmaiolino@redhat.com>,
	Christian Brauner <christianvanbrauner@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611:8-15: ERROR:
 PTR_ERR applied after initialization to constant on line 3607 (fwd)
Message-ID: <04873a5a-03eb-4025-96d2-1eaa63d1e9b1@kadam.mountain>
References: <alpine.DEB.2.22.394.2308121307551.3315@hadrien>
 <2c47913e-1b11-dbcd-4f65-e3b11dc41da@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c47913e-1b11-dbcd-4f65-e3b11dc41da@google.com>

On Sat, Aug 12, 2023 at 08:59:58AM -0700, Hugh Dickins wrote:
> > cocci warnings: (new ones prefixed by >>)
> > >> mm/shmem.c:3611:8-15: ERROR: PTR_ERR applied after initialization to constant on line 3607
> 
> I'm guessing that there is some common pattern of mistakes which this
> check has a good track record of catching, and then it is useful; but I
> don't see it as useful here - there is nothing wrong with PTR_ERR(NULL).

Yeah.  PTR_ERR(NULL) is valid.  That's used quite a bit in fs/.  There
was (is?) some functions that only returns error pointers and NULL and
never a valid pointer.

But in new code 90% (this is not hyperbole) of the time then the
PTR_ERR(NULL) warning finds buggy code.  Quite often the bug is harmless
like people think checking kmalloc() for both NULL and error pointers is
useful.  But it's definitely a useful heuristic.

regards,
dan carpenter

