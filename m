Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A0748D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 03:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Hxycsncq"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-41cc56255e3so21677361cf.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119547; x=1698724347; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FNn+70hJNuH/biBjt3LcX4BYJ4XcbaCBo0kT9hdJBbs=;
        b=HxycsncqtfpwBkJY0mXleQFyCBFARJJVJJzR9xIJwMBYfSY8NoQYKtue+TSTjOM6fA
         Ra5gGRsSuyvzgnbP1m9oGs1Y3USkT9cj12+H/+KgNvdGnc6OiWS8UFoxfBsmbDhXUhMZ
         LcGA7xL6D/V/TrV7A5k4/xlp/k+7eUTA/AejpiJ1PGzR0N5qd7X6Gu3fp2HAOuUfr3hi
         WMvrHtSECgrQ0wYyhgkoGyJx64xc9QIoq1RZbuQZByeYB0ZeuPdleAR/tLGR65Qn+cx1
         h8cXzxapBXHrR9jYuw91mRWoFZbtHCEMhguTIFWNcwl4vMmUAw8etGONZra3xW42zCb9
         q7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119547; x=1698724347;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNn+70hJNuH/biBjt3LcX4BYJ4XcbaCBo0kT9hdJBbs=;
        b=v0c5BbgnNL+bKhwTaiZdYCj51Q58xK8uPtzEJzS0eRFPjSHpPoWpB/tPidiN06qnTX
         Ym2cehFglM+ejw1Cjfl05p09qCpjsseEVhXcPqa44Ko9Qg6U6Xi+8mhGT4wNtqJLdZPe
         821MUVK3EzlBUbowXcnAlH0e9v6nZn89CtAQF1VzUJOuCmBqMFfT0igBokBggr8ImgrD
         pWpWc8a/TRbUGbPdi6gJ1b0WQcnKtGRLDUg4jQ+lFgP9Nhj9PBbXEdxAljta7MTcY6S8
         rrBLSYU/XMYVqeVvf4KB11WC3XzCEJa/VxI2hhLadxG3ZhRPvdz3RPf0yFLcCZFYzEHa
         V+YA==
X-Gm-Message-State: AOJu0YxxH6ZPh4U+CFdTsBdjHPx5yxOEW+D8EXFjzrMDkxwZUd6ZCHfB
	A2EDWtTwactIuts01jf1L0CT
X-Google-Smtp-Source: AGHT+IGqdcJvqniV0MdXgl1Gf1JN16bUg0SczAU7vGNec3Y9YP9xAFdPpWl6DX5GcZTFdKk+alMc3w==
X-Received: by 2002:a05:622a:1910:b0:417:d4b1:ea28 with SMTP id w16-20020a05622a191000b00417d4b1ea28mr15311291qtc.7.1698119547181;
        Mon, 23 Oct 2023 20:52:27 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id t10-20020ac8738a000000b00417db2593bdsm3196840qtp.72.2023.10.23.20.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:26 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:26 -0400
Message-ID: <48f091d301c39a9dae0f5d3b98b59776.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: kernel test robot <lkp@intel.com>, Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v11 7/19] ipe: add userspace interface
References: <1696457386-3010-8-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-8-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

On Oct  4, 2023 kernel test robot <lkp@intel.com> wrote:
> 
> As is typical with LSMs, IPE uses securityfs as its interface with
> userspace. for a complete list of the interfaces and the respective
> inputs/outputs, please see the documentation under
> admin-guide/LSM/ipe.rst
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v2:
>   + Split evaluation loop, access control hooks,
>     and evaluation loop from policy parser and userspace
>     interface to pass mailing list character limit
> 
> v3:
>   + Move policy load and activation audit event to 03/12
>   + Fix a potential panic when a policy failed to load.
>   + use pr_warn for a failure to parse instead of an
>     audit record
>   + Remove comments from headers
>   + Add lockdep assertions to ipe_update_active_policy and
>     ipe_activate_policy
>   + Fix up warnings with checkpatch --strict
>   + Use file_ns_capable for CAP_MAC_ADMIN for securityfs
>     nodes.
>   + Use memdup_user instead of kzalloc+simple_write_to_buffer.
>   + Remove strict_parse command line parameter, as it is added
>     by the sysctl command line.
>   + Prefix extern variables with ipe_
> 
> v4:
>   + Remove securityfs to reverse-dependency
>   + Add SHA1 reverse dependency.
>   + Add versioning scheme for IPE properties, and associated
>     interface to query the versioning scheme.
>   + Cause a parser to always return an error on unknown syntax.
>   + Remove strict_parse option
>   + Change active_policy interface from sysctl, to securityfs,
>     and change scheme.
> 
> v5:
>   + Cause an error if a default action is not defined for each
>     operation.
>   + Minor function renames
> 
> v6:
>   + No changes
> 
> v7:
>   + Propagating changes to support the new ipe_context structure in the
>     evaluation loop.
> 
>   + Further split the parser and userspace interface changes into
>     separate commits.
> 
>   + "raw" was renamed to "pkcs7" and made read only
>   + "raw"'s write functionality (update a policy) moved to "update"
>   + introduced "version", "policy_name" nodes.
>   + "content" renamed to "policy"
>   + changes to allow the compiled-in policy to be treated
>     identical to deployed-after-the-fact policies.
> 
> v8:
>   + Prevent securityfs initialization if the LSM is disabled
> 
> v9:
>   + Switch to securityfs_recursive_remove for policy folder deletion
> 
> v10:
>   + Simplify and correct concurrency
>   + Fix typos
> 
> v11:
>   + Correct code comments
> ---
>  security/ipe/Makefile    |   2 +
>  security/ipe/fs.c        | 101 ++++++++
>  security/ipe/fs.h        |  16 ++
>  security/ipe/ipe.c       |   3 +
>  security/ipe/ipe.h       |   2 +
>  security/ipe/policy.c    | 112 +++++++++
>  security/ipe/policy.h    |   9 +
>  security/ipe/policy_fs.c | 481 +++++++++++++++++++++++++++++++++++++++
>  8 files changed, 726 insertions(+)
>  create mode 100644 security/ipe/fs.c
>  create mode 100644 security/ipe/fs.h
>  create mode 100644 security/ipe/policy_fs.c

...

> diff --git a/security/ipe/fs.c b/security/ipe/fs.c
> new file mode 100644
> index 000000000000..522162af741a
> --- /dev/null
> +++ b/security/ipe/fs.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Microsoft Corporation. All rights reserved.
> + */
> +
> +#include <linux/dcache.h>
> +#include <linux/security.h>
> +
> +#include "ipe.h"
> +#include "fs.h"
> +#include "policy.h"
> +
> +static struct dentry *np __ro_after_init;
> +static struct dentry *root __ro_after_init;
> +struct dentry *policy_root __ro_after_init;
> +
> +/**
> + * new_policy - Write handler for the securityfs node, "ipe/new_policy".
> + * @f: Supplies a file structure representing the securityfs node.
> + * @data: Suppleis a buffer passed to the write syscall.
> + * @len: Supplies the length of @data.
> + * @offset: unused.
> + *
> + * Return:
> + * * >0	- Success, Length of buffer written
> + * * <0	- Error
> + */
> +static ssize_t new_policy(struct file *f, const char __user *data,
> +			  size_t len, loff_t *offset)
> +{
> +	int rc = 0;
> +	char *copy = NULL;
> +	struct ipe_policy *p = NULL;
> +
> +	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
> +		return -EPERM;
> +
> +	copy = memdup_user_nul(data, len);
> +	if (IS_ERR(copy))
> +		return PTR_ERR(copy);
> +
> +	p = ipe_new_policy(NULL, 0, copy, len);
> +	if (IS_ERR(p)) {
> +		rc = PTR_ERR(p);
> +		goto out;
> +	}
> +
> +	rc = ipe_new_policyfs_node(p);
> +
> +out:
> +	if (rc < 0 && !IS_ERR(p))

Since @p is check for error above after the call to ipe_new_policy()
you shouldn't need to check it again here, right?  I think all you
need to do is check @rc.

> +		ipe_free_policy(p);
> +	kfree(copy);
> +	return (rc < 0) ? rc : len;
> +}
> +
> +static const struct file_operations np_fops = {
> +	.write = new_policy,
> +};
> +
> +/**
> + * ipe_init_securityfs - Initialize IPE's securityfs tree at fsinit.
> + *
> + * Return:
> + * * !0	- Error
> + * * 0	- OK
> + */
> +static int __init ipe_init_securityfs(void)
> +{
> +	int rc = 0;
> +
> +	if (!ipe_enabled)
> +		return -EOPNOTSUPP;
> +
> +	root = securityfs_create_dir("ipe", NULL);
> +	if (IS_ERR(root)) {
> +		rc = PTR_ERR(root);
> +		goto err;
> +	}
> +
> +	policy_root = securityfs_create_dir("policies", root);
> +	if (IS_ERR(policy_root)) {
> +		rc = PTR_ERR(policy_root);
> +		goto err;
> +	}
> +
> +	np = securityfs_create_file("new_policy", 0200, root, NULL, &np_fops);
> +	if (IS_ERR(np)) {
> +		rc = PTR_ERR(np);
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	securityfs_remove(np);
> +	securityfs_remove(policy_root);
> +	securityfs_remove(root);
> +	return rc;
> +}
> +
> +fs_initcall(ipe_init_securityfs);

...

> diff --git a/security/ipe/policy.c b/security/ipe/policy.c
> index 3a529c7950a1..33bbc43f0d6f 100644
> --- a/security/ipe/policy.c
> +++ b/security/ipe/policy.c
> @@ -43,6 +71,65 @@ static int set_pkcs7_data(void *ctx, const void *data, size_t len,
>  	return 0;
>  }
>  
> +/**
> + * ipe_update_policy - parse a new policy and replace old with it.
> + * @root: Supplies a pointer to the securityfs inode saved the policy.
> + * @text: Supplies a pointer to the plain text policy.
> + * @textlen: Supplies the length of @text.
> + * @pkcs7: Supplies a pointer to a buffer containing a pkcs7 message.
> + * @pkcs7len: Supplies the length of @pkcs7len.
> + *
> + * @text/@textlen is mutually exclusive with @pkcs7/@pkcs7len - see
> + * ipe_new_policy.
> + *
> + * Context: Requires root->i_rwsem and ipe_policy_lock to be held.
> + * Return:
> + * * !IS_ERR	- The existing policy saved in the inode before update
> + * * -ENOENT	- Policy doesn't exist
> + * * -EINVAL	- New policy is invalid
> + */
> +struct ipe_policy *ipe_update_policy(struct inode *root,
> +				     const char *text, size_t textlen,
> +				     const char *pkcs7, size_t pkcs7len)
> +{
> +	int rc = 0;
> +	struct ipe_policy *old, *ap, *new = NULL;
> +
> +	lockdep_assert_held(&ipe_policy_lock);
> +
> +	old = (struct ipe_policy *)root->i_private;
> +	if (!old)
> +		return ERR_PTR(-ENOENT);
> +
> +	new = ipe_new_policy(text, textlen, pkcs7, pkcs7len);
> +	if (IS_ERR(new))
> +		return new;
> +
> +	if (strcmp(new->parsed->name, old->parsed->name)) {
> +		rc = -EINVAL;
> +		goto err;
> +	}
> +
> +	if (ver_to_u64(old) > ver_to_u64(new)) {
> +		rc = -EINVAL;
> +		goto err;
> +	}
> +
> +	root->i_private = new;
> +
> +	ap = rcu_dereference_protected(ipe_active_policy,
> +				       lockdep_is_held(&ipe_policy_lock));
> +	if (old == ap)
> +		rcu_assign_pointer(ipe_active_policy, new);

Is there any reason why you couldn't call ipe_set_active_pol() here
and avoid duplicated code?

> +	swap(new->policyfs, old->policyfs);
> +
> +	return old;
> +err:
> +	ipe_free_policy(new);
> +	return ERR_PTR(rc);
> +}
> +
>  /**
>   * ipe_new_policy - Allocate and parse an ipe_policy structure.
>   *
> @@ -99,3 +186,28 @@ struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
>  	ipe_free_policy(new);
>  	return ERR_PTR(rc);
>  }
> +
> +/**
> + * ipe_set_active_pol - Make @p the active policy.
> + * @p: Supplies a pointer to the policy to make active.
> + *
> + * Context: Requires root->i_rwsem and ipe_policy_lock to be held.
> + * Return:
> + * * !IS_ERR	- Success
> + * * -EINVAL	- New active policy version is invalid
> + */
> +int ipe_set_active_pol(const struct ipe_policy *p)
> +{
> +	struct ipe_policy *ap = NULL;
> +
> +	lockdep_assert_held(&ipe_policy_lock);
> +
> +	ap = rcu_dereference_protected(ipe_active_policy,
> +				       lockdep_is_held(&ipe_policy_lock));
> +	if (ap && ver_to_u64(ap) > ver_to_u64(p))
> +		return -EINVAL;

In ipe_update_policy() there is also a name check, is that important
here, or is the policy name only important on an "update" op?

> +	rcu_assign_pointer(ipe_active_policy, p);
> +
> +	return 0;
> +}

...

> diff --git a/security/ipe/policy_fs.c b/security/ipe/policy_fs.c
> new file mode 100644
> index 000000000000..52a120118cda
> --- /dev/null
> +++ b/security/ipe/policy_fs.c
> @@ -0,0 +1,481 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Microsoft Corporation. All rights reserved.
> + */
> +#include <linux/fs.h>
> +#include <linux/namei.h>
> +#include <linux/types.h>
> +#include <linux/dcache.h>
> +#include <linux/security.h>
> +
> +#include "ipe.h"
> +#include "policy.h"
> +#include "eval.h"
> +#include "fs.h"
> +
> +#define MAX_VERSION_SIZE ARRAY_SIZE("65535.65535.65535")
> +
> +/**
> + * ipefs_file - defines a file in securityfs.
> + */
> +struct ipefs_file {
> +	const char *name;
> +	umode_t access;
> +	const struct file_operations *fops;
> +};
> +
> +/**
> + * read_pkcs7 - Read handler for "ipe/policies/$name/pkcs7".
> + * @f: Supplies a file structure representing the securityfs node.
> + * @data: Suppleis a buffer passed to the write syscall.
> + * @len: Supplies the length of @data.
> + * @offset: unused.
> + *
> + * @data will be populated with the pkcs7 blob representing the policy
> + * on success. If the policy is unsigned (like the boot policy), this
> + * will return -ENOENT.
> + *
> + * Return:
> + * * >0	- Success, Length of buffer written
> + * * <0	- Error
> + */
> +static ssize_t read_pkcs7(struct file *f, char __user *data,
> +			  size_t len, loff_t *offset)
> +{
> +	int rc = 0;
> +	struct inode *root = NULL;
> +	const struct ipe_policy *p = NULL;
> +
> +	root = d_inode(f->f_path.dentry->d_parent);
> +
> +	inode_lock_shared(root);
> +	p = (struct ipe_policy *)root->i_private;
> +	if (!p) {
> +		rc = -ENOENT;
> +		goto out;
> +	}
> +
> +	if (!p->pkcs7) {
> +		rc = -ENOENT;
> +		goto out;
> +	}

All of the other "read" functions don't check for a previously read
value, it might be nice to add a comment explaining why
ipe_policy::pkcs7 is handled differently.

> +	rc = simple_read_from_buffer(data, len, offset, p->pkcs7, p->pkcs7len);
> +
> +out:
> +	inode_unlock_shared(root);
> +
> +	return rc;
> +}

...

> +/**
> + * read_version - Read handler for "ipe/policies/$name/version".
> + * @f: Supplies a file structure representing the securityfs node.
> + * @data: Suppleis a buffer passed to the write syscall.
> + * @len: Supplies the length of @data.
> + * @offset: unused.
> + *
> + * @data will be populated with the version string on success.
> + *
> + * Return:
> + * * >0	- Success, Length of buffer written
> + * * <0	- Error
> + */
> +static ssize_t read_version(struct file *f, char __user *data,
> +			    size_t len, loff_t *offset)
> +{
> +	ssize_t rc = 0;
> +	size_t bufsize = 0;
> +	struct inode *root = NULL;
> +	const struct ipe_policy *p = NULL;
> +	char buffer[MAX_VERSION_SIZE] = { 0 };
> +
> +	root = d_inode(f->f_path.dentry->d_parent);
> +
> +	inode_lock_shared(root);
> +	p = (struct ipe_policy *)root->i_private;
> +	if (!p) {
> +		rc = -ENOENT;
> +		goto out;
> +	}
> +
> +	bufsize = scnprintf(buffer, ARRAY_SIZE(buffer), "%hu.%hu.%hu",
> +			    p->parsed->version.major, p->parsed->version.minor,
> +			    p->parsed->version.rev);

I don't understand why scnprintf() is needed here, you know the size
of @buffer, just use that; what am I missing?

  bufsize = sizeof(buffer);

> +	rc = simple_read_from_buffer(data, len, offset, buffer, bufsize);
> +
> +out:
> +	inode_unlock_shared(root);
> +
> +	return rc;
> +}
> +
> +/**
> + * setactive - Write handler for "ipe/policies/$name/active".
> + * @f: Supplies a file structure representing the securityfs node.
> + * @data: Supplies a buffer passed to the write syscall.
> + * @len: Supplies the length of @data.
> + * @offset: unused.
> + *
> + * Return:
> + * * >0	- Success, Length of buffer written
> + * * <0	- Error
> + */
> +static ssize_t setactive(struct file *f, const char __user *data,
> +			 size_t len, loff_t *offset)
> +{
> +	int rc = 0;
> +	bool value = false;
> +	struct inode *root = NULL;
> +	const struct ipe_policy *p = NULL;
> +
> +	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
> +		return -EPERM;
> +
> +	rc = kstrtobool_from_user(data, len, &value);
> +	if (rc)
> +		return rc;
> +
> +	if (!value)
> +		return -EINVAL;
> +
> +	root = d_inode(f->f_path.dentry->d_parent);
> +	inode_lock(root);
> +	mutex_lock(&ipe_policy_lock);
> +
> +	p = (struct ipe_policy *)root->i_private;
> +	if (!p) {
> +		rc = -ENOENT;
> +		goto out;
> +	}
> +
> +	rc = ipe_set_active_pol(p);
> +
> +out:
> +	mutex_unlock(&ipe_policy_lock);
> +	inode_unlock(root);
> +	synchronize_rcu();

Why the synchronize_rcu() call here?  I'm guessing it is because of
ipe_set_active_pol(), if that is the case, shouldn't it be calling
synchronize_rcu()?  Of course that would require some lock/unlock
shuffling in this function, but that seems reasonable.

> +	return (rc < 0) ? rc : len;
> +}
> +
> +/**
> + * getactive - Read handler for "ipe/policies/$name/active".
> + * @f: Supplies a file structure representing the securityfs node.
> + * @data: Suppleis a buffer passed to the write syscall.
> + * @len: Supplies the length of @data.
> + * @offset: unused.
> + *
> + * @data will be populated with the 1 or 0 depending on if the
> + * corresponding policy is active.
> + *
> + * Return:
> + * * >0	- Success, Length of buffer written
> + * * <0	- Error
> + */
> +static ssize_t getactive(struct file *f, char __user *data,
> +			 size_t len, loff_t *offset)
> +{
> +	int rc = 0;
> +	const char *str;
> +	struct inode *root = NULL;
> +	const struct ipe_policy *p = NULL;
> +
> +	root = d_inode(f->f_path.dentry->d_parent);
> +
> +	inode_lock_shared(root);
> +	p = (struct ipe_policy *)root->i_private;
> +	if (!p) {
> +		inode_unlock_shared(root);
> +		return -ENOENT;
> +	}
> +	inode_unlock_shared(root);
> +
> +	str = (p == rcu_access_pointer(ipe_active_policy)) ? "1" : "0";
> +	rc = simple_read_from_buffer(data, len, offset, str, 1);

If @ipe_active_policy is an RCU protected pointer, shouldn't the RCU
read lock be held here?  If you are relying on a caller for that, 1)
you can nest RCU read locks, and 2) it should ideally be noted in the
functions header comment.

> +	return rc;
> +}
> +
> +/**
> + * update_policy - Write handler for "ipe/policies/$name/update".
> + * @f: Supplies a file structure representing the securityfs node.
> + * @data: Supplies a buffer passed to the write syscall.
> + * @len: Supplies the length of @data.
> + * @offset: unused.
> + *
> + * On success this updates the policy represented by $name,
> + * in-place.
> + *
> + * Return:
> + * * >0	- Success, Length of buffer written
> + * * <0	- Error
> + */
> +static ssize_t update_policy(struct file *f, const char __user *data,
> +			     size_t len, loff_t *offset)
> +{
> +	char *copy = NULL;
> +	struct inode *root = NULL;
> +	struct ipe_policy *old = NULL;
> +
> +	if (!file_ns_capable(f, &init_user_ns, CAP_MAC_ADMIN))
> +		return -EPERM;
> +
> +	copy = memdup_user(data, len);
> +	if (IS_ERR(copy))
> +		return PTR_ERR(copy);
> +
> +	root = d_inode(f->f_path.dentry->d_parent);
> +	inode_lock(root);
> +	mutex_lock(&ipe_policy_lock);
> +	old = ipe_update_policy(root, NULL, 0, copy, len);
> +	mutex_unlock(&ipe_policy_lock);
> +	inode_unlock(root);
> +	synchronize_rcu();

See my synchronize_rcu() comment in setactive(), it seems relevant here.

> +	kfree(copy);
> +	if (IS_ERR(old))
> +		return PTR_ERR(old);
> +	ipe_free_policy(old);
> +
> +	return len;
> +}

...

> +/**
> + * ipe_new_policyfs_node - Create a securityfs entry for @p.
> + * @p: Supplies a pointer to the policy to create a securityfs entry for.
> + *
> + * Return:
> + * * 0	- OK
> + * * !0	- Error
> + */
> +int ipe_new_policyfs_node(struct ipe_policy *p)
> +{
> +	int rc = 0;
> +	size_t i = 0;
> +	struct dentry *d = NULL;
> +	struct dentry *policyfs = NULL;
> +	struct inode *root = NULL;
> +	const struct ipefs_file *f = NULL;
> +
> +	if (p->policyfs)
> +		return 0;
> +
> +	policyfs = securityfs_create_dir(p->parsed->name, policy_root);
> +	if (IS_ERR(policyfs)) {
> +		rc = PTR_ERR(policyfs);
> +		goto err;
> +	}
> +
> +	root = d_inode(policyfs);
> +
> +	for (i = 0; i < ARRAY_SIZE(policy_subdir); ++i) {
> +		f = &policy_subdir[i];
> +
> +		d = securityfs_create_file(f->name, f->access, policyfs,
> +					   NULL, f->fops);

Is there a potential issue with the file being created in IPE's
securityfs, but not yet present in ipe_policy::policyfs?  Should IPE
set '@p->policyfs = policyfs' before this for-loop, and reset/NULL it
if an error occurs?

> +		if (IS_ERR(d)) {
> +			rc = PTR_ERR(d);
> +			goto err;
> +		}
> +	}
> +
> +	inode_lock(root);
> +	mutex_lock(&ipe_policy_lock);
> +	p->policyfs = policyfs;
> +	root->i_private = p;
> +	mutex_unlock(&ipe_policy_lock);
> +	inode_unlock(root);
> +
> +	return 0;
> +err:
> +	securityfs_recursive_remove(policyfs);
> +	return rc;
> +}
> -- 
> 2.25.1

--
paul-moore.com
