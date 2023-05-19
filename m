Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850F120F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 07:55:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f4ec041fc3so17976435e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684482922; x=1687074922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2IWtMjwLyymKWYfssxY5B2RrRWeeajNS4FEZ7e6+pQ=;
        b=rkQCEXNBjV+7HtrpfXi4id9Bw69Svwj1F8DP5oIod7tEo+B6ju/4lUN+QMFnqWOVde
         093Sy/k/4EU2ZqLoHJx6xN0Zqv8OohLIZ5gWzWeUHizE72rh8cs2d2Z575liFMFaBfx8
         1wLRSmdt4bSHyyBCMk9olM7Sfs/mpd9hwPGCz/kl+GetX8abgPstQmmNFMM9V6o6YwfC
         cjbaaVq3KpuR+3BEt4iolPSbzryP+JZ/jelGZ4jbmCVgxhXTJ8YSY5/Tx5CxhCLw79Vv
         qDi3o/DQK+YDTuml2wplSsd+RyK9wyQMUroyfR+CIHCxUwyAzCzxIHh1Du1+9UQ2+BbF
         XS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684482922; x=1687074922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2IWtMjwLyymKWYfssxY5B2RrRWeeajNS4FEZ7e6+pQ=;
        b=lMoeVmT+GYY5UXOAciEFjeXjL0qborSxK+97rG+I+BPbW8axAufYsKIPmfF5zi3emk
         XOLKOvhdzzpIHyVHAiL1Fg5Yb/6KbUOUG18Z2RfP39rRCFJqlLb43CPIlqgvvz4kMCWy
         dBYxcAo0zXXEHXIhOZ/TFDmf6kq03//V7x9KzAxRVQ3e0wyXiXTCLdsjEsYpvwkk9dAc
         c7HNB8wdqfga3ITk+Tof6++cQqo/kF7yoCd2O0v7Qc2Fu7cyJEXGSzScq7GeyjMcpnVf
         giSkfUtX9PM2n+izxtE5EnOF4gDyKyPGKnlr+c1odSdR6+5LzNpxHUenZk3cyzfesO5/
         tj6Q==
X-Gm-Message-State: AC+VfDzaZK6sinWoxIvPMsme8YaLGvl+8Vqzsd4wHdAvpzU9MBeOKtvc
	yhEq5WxLr++/C1/9eRJOZpZ47A==
X-Google-Smtp-Source: ACHHUZ5t2y4BhTs+MzCVRYOfMHS8JRiIjSRoypEgmVNUehmIg+AKSb/H2hxMz0qGxDtFqAmAC+UFmg==
X-Received: by 2002:a7b:cc8e:0:b0:3f4:1dd9:e9de with SMTP id p14-20020a7bcc8e000000b003f41dd9e9demr796303wma.8.1684482922531;
        Fri, 19 May 2023 00:55:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z17-20020adfec91000000b002e5f6f8fc4fsm4568709wrn.100.2023.05.19.00.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 00:55:20 -0700 (PDT)
Date: Fri, 19 May 2023 10:55:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Oscar Salvador <osalvador@suse.de>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2908/3314] lib/stackdepot.c:544 stack_print()
 warn: unsigned 'stack->size' is never less than zero.
Message-ID: <1ba934d3-0b6a-42ae-83d3-5a5b952468d1@kili.mountain>
References: <202305182345.LTMlWG84-lkp@intel.com>
 <20230518133247.a0ece8de7c3fc5dca9e1b67d@linux-foundation.org>
 <110d728f-b125-4358-9839-13e094597ef9@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rzrKfzf8CBDpbqDn"
Content-Disposition: inline
In-Reply-To: <110d728f-b125-4358-9839-13e094597ef9@kili.mountain>


--rzrKfzf8CBDpbqDn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 19, 2023 at 10:21:37AM +0300, Dan Carpenter wrote:
> On Thu, May 18, 2023 at 01:32:47PM -0700, Andrew Morton wrote:
> > On Thu, 18 May 2023 23:44:10 +0800 kernel test robot <lkp@intel.com> wrote:
> > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   798d276b39e984345d52b933a900a71fa0815928
> > > commit: e435b85a4aea7a82259105d5d8025655460052e1 [2908/3314] mm, page_owner: add page_owner_stacks file to print out only stacks and their counte
> > > config: x86_64-randconfig-m001
> > > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202305182345.LTMlWG84-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > lib/stackdepot.c:544 stack_print() warn: unsigned 'stack->size' is never less than zero.
> > > 
> > 
> > Linus would complain about that warning.
> > 
> 
> Yeah.  I hadn't intended that warning to be printed.  It's supposed
> to check for if the check for negatives is paired with an upper bound
> check.  That Smatch check is original vintage from 2009 so it's due for
> a re-write.

Done.  I'll test it out a bit and push next week.

regards,
dan carpenter


--rzrKfzf8CBDpbqDn
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_unsigned_lt_zero.c"

/*
 * Copyright (C) 2009 Dan Carpenter.
 * Copyright 2023 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_extra.h"

static int my_id;

static bool is_upper_op(int op)
{
	switch (op) {
	case '>':
	case SPECIAL_GTE:
	case SPECIAL_UNSIGNED_GT:
	case SPECIAL_UNSIGNED_GTE:
		return true;
	}
	return false;
}

static bool is_upper(struct expression *var, struct expression *cond)
{
	if (cond->type == EXPR_COMPARE &&
	    is_upper_op(cond->op) &&
	    expr_equiv(var, cond->left))
		return true;
	return false;
}

static bool has_upper_bound(struct expression *expr)
{
	struct expression *var = strip_expr(expr->left);
	struct expression *parent, *prev;

	parent = expr;
	prev = expr;
	while ((parent = expr_get_parent_expr(parent))) {
		if (parent->type == EXPR_LOGICAL &&
		    parent->op == SPECIAL_LOGICAL_AND)
			break;
		if (parent->type == EXPR_LOGICAL &&
		    parent->op == SPECIAL_LOGICAL_OR) {
			if (prev == parent->left &&
			    is_upper(var, parent->right))
				return true;
			if (prev == parent->right &&
			    is_upper(var, parent->left))
				return true;
		}
		prev = parent;
	}

	return false;
}

static void match_condition(struct expression *expr)
{
	char *name;

	if (expr->type != EXPR_COMPARE ||
	    expr->op != SPECIAL_UNSIGNED_LT ||
	    expr->op != SPECIAL_UNSIGNED_LTE)
		return;

	if (!expr_is_zero(expr->right))
		return;

	if (has_upper_bound(expr))
		return;

	name = expr_to_str(expr->left);
	sm_warning("unsigned '%s' is never less than zero.", name);
	free_string(name);
}

void check_unsigned_lt_zero(int id)
{
	my_id = id;

	add_hook(&match_condition, CONDITION_HOOK);
}

--rzrKfzf8CBDpbqDn--
