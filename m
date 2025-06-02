Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA322F14C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875967; cv=none; b=L9YMDWMBQxc8EIqhGk15Pv66u3l4fudOm36Bc55RJQWQuuSUfBSP6uX15hqM/E0I2y3EGCEVeG7pXtHXnbYGzSFGwfSJVaoCVQO6QtE7mJyIv6NgLPsUs4VXaKcJF8W2CoVlPlXm3VKoCmLnbSaZjWIGVkzHx6rx3VGODE0d9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875967; c=relaxed/simple;
	bh=jylN3WxyrQyqqaQ20fOx41X52y2IzYXWK79bb3JhcZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQwlgJ0zMNxwpPR6yc2H7zoGIY4yjMgP/UlcNOIpIszaTOWbq5MmQ3GvD1pF/UeMyumljVFPW1TpY5MA1AAQAMd1Ky1XbYIUlJyI2DqsQxl6qfDlRoZQprEq4EG6yg67KLgYgU2o88eBAmtW7OXwEpfYHUxX0WCawL92lPeWPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpJqnZvN; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpJqnZvN"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70f31433d96so42085177b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Jun 2025 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748875965; x=1749480765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76sd53eSyvjHFmX9Hf2WRuEGfzgy55oGQBEa4L2zRnU=;
        b=RpJqnZvNwyeeztRJGP0Eg9HHPm19DU+tl0eKE82BkgBQ5RVTRT9UU4gHCxMP7Xbj+g
         Jaot028/jtzj5bkFCxqJtWjLof8JtlJVBTsrtlcvD+0YhbdDVDaNYW1iL4GYX/tlrL6g
         2kYpK75oU+29m7/ys7dCy9nXuU3afOCp1RudU1dqMmm4KZzBOz28e/yy2hPBLl8c/qC4
         mzNOgRQV1Fta8r5dEy8PkCRpq+XJJb2Ggcc3cZIJfSG7lkeA8/4B6mej1ikgzMkUa5Ug
         d73EdtJcNi2v0U4dufGbpjVgKKW1Kx33Qgnc0wAXspNcHMI9+oSBw6hWQwMLDCPsvHcA
         kKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875965; x=1749480765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76sd53eSyvjHFmX9Hf2WRuEGfzgy55oGQBEa4L2zRnU=;
        b=v79h8p97+HXTUAZcJ6yeTfHjXD5NI+Xgaoa7/B/QpqLvMGZiXbxQ1Q2XXVBRPxtBrQ
         WW8pBi+9H6sSE0+k6hwdDS946rKAxvjNaXJtICtEarZV6FjOsY10ovlD8jA70KV0SLld
         yqX9qxvNg8rOuUg/M3g3CIhCzcBFHPb30o8q8NDB7ifDAJVqq+XhilEiZeujX8j85udL
         D8T4dcUg619aX0SfZ38FhGfiB3OH1GDdTZ0IFZ9JpxE3PBx4nQGZY7PClT27behmg+E5
         77R2mGxWu4/QEeCbTY4bUNAul1s9bJQ29yZtio7p7K6UYJR0s1Dqk1xQNyPe0gRuE7s9
         gwzw==
X-Forwarded-Encrypted: i=1; AJvYcCUjCoNEBnzv6R/3BdDHmiwETyzncmsWM3XpunvG25wuRJu3McsaiqdZPGkUzM7tqn6MzfFM8/Xx7AIPVVpD@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/ZKWYUgxZPvsOiAsmOIcI0L6jXKsMtIXB7MYrnMhHiBDyrFV5
	E3ibXlewEOqO9qgl38TcrdYtvjh6OGbKozg1Xy1LskzCO8HBS8sUGh+4
X-Gm-Gg: ASbGncsTaXtn93EFCaaAc8Y5o3HOcGQhnVG6/LhPxaOS7MZzkqWoMdbI/bGILTHZWdG
	JOgUEUtFAbSxMrPAGRmC59hGto0588aOBjS2GYv/u8D80Tk1S0HSCdY2DIOaerCCC387qpmmfHF
	fma0kLYijBm6CmVbYyFYJEMiP+nq6k0W9oSGl+Gqix8BbPQAWJdfUZA5WdLTZjw1EfJ8IrNqGEi
	K5dbJbeCfQrYaEwR3CRz0f54pDrcdBH5r3AIJl32Tmqoo4lNAfq9ebJn4B73whC01GRWXU70ONN
	OHYXseM4mOy3NKhSRUU7zzcwmluVwKaAPPjZ7JumSYYwz79Hog==
X-Google-Smtp-Source: AGHT+IEsgSp200jiLK+JMX2zF3T0B7XKAG0dLeZ5mmTJTjJ/BXwU5aM/+R7TYdq3m+S8I9xo+XiTZg==
X-Received: by 2002:a05:690c:4d84:b0:70d:ffaf:48ed with SMTP id 00721157ae682-71057d61298mr155431007b3.33.1748875964793;
        Mon, 02 Jun 2025 07:52:44 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abee892sm20949177b3.32.2025.06.02.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:52:42 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gregory Price <gourry@gourry.net>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Honggyu Kim <honggyu.kim@sk.com>
Subject: Re: mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field
Date: Mon,  2 Jun 2025 07:52:39 -0700
Message-ID: <20250602145240.1868958-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aD0-JNr0Z83OpXg4@harry>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2 Jun 2025 15:01:08 +0900 Harry Yoo <harry.yoo@oracle.com> wrote:

> On Sun, Jun 01, 2025 at 01:34:46PM +0800, kernel test robot wrote:
> > cocci warnings: (new ones prefixed by >>)
> > >> mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field
> > 
> > vim +3719 mm/mempolicy.c
> > 
> >   3700	
> >   3701	static void wi_state_free(void)
> >   3702	{
> >   3703		struct weighted_interleave_state *old_wi_state;
> >   3704	
> >   3705		mutex_lock(&wi_state_lock);
> >   3706	
> >   3707		old_wi_state = rcu_dereference_protected(wi_state,
> >   3708				lockdep_is_held(&wi_state_lock));
> >   3709		if (!old_wi_state) {
> >   3710			mutex_unlock(&wi_state_lock);
> >   3711			goto out;
> >   3712		}
> >   3713	
> >   3714		rcu_assign_pointer(wi_state, NULL);
> >   3715		mutex_unlock(&wi_state_lock);
> >   3716		synchronize_rcu();
> >   3717		kfree(old_wi_state);
> >   3718	out:
> > > 3719		kfree(&wi_group->wi_kobj);
> 
> Hmm maybe Joshua meant kfree(wi_group)?
> 
> Anyway, practically it's the same as kfree(wi_group) and something strange
> is happening there.
> 
> in add_weighted_interleave_group() (the only caller of wi_cleanup()),
> kobject_del() and kobject_put() are called after wi_cleanup() freed
> wi_group in the error path.

Hi Harry,

Thanks for your suggestion and insight! This is totally a slip-up on my end.

I completely missed the kobject_{put, delete} that gets called immediately
after this, which is embarrassing because rebasing on top of Rakie's patch
(which introduces those proper freeing calls) was the main focus of this v8.

From what I can tell, I think the solution here is to just remove the goto
statement entirely. There is no need to free the wi_group here, and it
would also be bad practice to do more than the function name suggests anyways.

Let me send a patch that gets rid of the goto statement, and just returns if
there is no old_wi_state. While I'm at it, I'll send in a patch from
David Hildenbrand that is an optimization in this area. 

Thanks again for taking a look Harry, hope you have a great day!
Joshua

> 
> >   3720	}
> >   3721	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> 
> -- 
> Cheers,
> Harry / Hyeonggon
