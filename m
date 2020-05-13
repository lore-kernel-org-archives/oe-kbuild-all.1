Content-Type: multipart/mixed; boundary="===============8441997199174106319=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] staging: android: ashmem: Fixed a issue related to file_operations
Date: Thu, 14 May 2020 00:44:19 +0800
Message-ID: <202005140059.lGcs9gbv%lkp@intel.com>
In-Reply-To: <20200513114116.26410-1-user@debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8441997199174106319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Anmol,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on v5.7-rc5 next-20200512]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Anmol/staging-android-ashm=
em-Fixed-a-issue-related-to-file_operations/20200513-194410
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
1ff4388a06eb001efbc272754ef750c0b97817cb
config: um-allmodconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

drivers/staging/android/ashmem.c: In function 'ashmem_mmap':
>> drivers/staging/android/ashmem.c:418:16: error: assignment of read-only =
variable 'vmfile_fops'
vmfile_fops =3D *vmfile->f_op;
^
>> drivers/staging/android/ashmem.c:419:21: error: assignment of member 'mm=
ap' in read-only object
vmfile_fops.mmap =3D ashmem_vmfile_mmap;
^
>> drivers/staging/android/ashmem.c:420:34: error: assignment of member 'ge=
t_unmapped_area' in read-only object
vmfile_fops.get_unmapped_area =3D
^

vim +/vmfile_fops +418 drivers/staging/android/ashmem.c

6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  367  =

11980c2ac4ccfa Robert Love        2011-12-20  368  static int ashmem_mmap(s=
truct file *file, struct vm_area_struct *vma)
11980c2ac4ccfa Robert Love        2011-12-20  369  {
823a00202dabb1 Anmol              2020-05-13  370  	static const struct fil=
e_operations vmfile_fops;
11980c2ac4ccfa Robert Love        2011-12-20  371  	struct ashmem_area *asm=
a =3D file->private_data;
11980c2ac4ccfa Robert Love        2011-12-20  372  	int ret =3D 0;
11980c2ac4ccfa Robert Love        2011-12-20  373  =

11980c2ac4ccfa Robert Love        2011-12-20  374  	mutex_lock(&ashmem_mute=
x);
11980c2ac4ccfa Robert Love        2011-12-20  375  =

11980c2ac4ccfa Robert Love        2011-12-20  376  	/* user needs to SET_SI=
ZE before mapping */
59848d6aded59a Alistair Strachan  2018-06-19  377  	if (!asma->size) {
11980c2ac4ccfa Robert Love        2011-12-20  378  		ret =3D -EINVAL;
11980c2ac4ccfa Robert Love        2011-12-20  379  		goto out;
11980c2ac4ccfa Robert Love        2011-12-20  380  	}
11980c2ac4ccfa Robert Love        2011-12-20  381  =

8632c614565d0c Alistair Strachan  2018-06-19  382  	/* requested mapping si=
ze larger than object size */
8632c614565d0c Alistair Strachan  2018-06-19  383  	if (vma->vm_end - vma->=
vm_start > PAGE_ALIGN(asma->size)) {
11980c2ac4ccfa Robert Love        2011-12-20  384  		ret =3D -EINVAL;
11980c2ac4ccfa Robert Love        2011-12-20  385  		goto out;
11980c2ac4ccfa Robert Love        2011-12-20  386  	}
11980c2ac4ccfa Robert Love        2011-12-20  387  =

11980c2ac4ccfa Robert Love        2011-12-20  388  	/* requested protection=
 bits must match our allowed protection mask */
59848d6aded59a Alistair Strachan  2018-06-19  389  	if ((vma->vm_flags & ~c=
alc_vm_prot_bits(asma->prot_mask, 0)) &
59848d6aded59a Alistair Strachan  2018-06-19  390  	    calc_vm_prot_bits(P=
ROT_MASK, 0)) {
11980c2ac4ccfa Robert Love        2011-12-20  391  		ret =3D -EPERM;
11980c2ac4ccfa Robert Love        2011-12-20  392  		goto out;
11980c2ac4ccfa Robert Love        2011-12-20  393  	}
56f76fc68492af Arve Hj=C3=B8nnev=C3=A5g     2011-12-20  394  	vma->vm_flags=
 &=3D ~calc_vm_may_flags(~asma->prot_mask);
11980c2ac4ccfa Robert Love        2011-12-20  395  =

11980c2ac4ccfa Robert Love        2011-12-20  396  	if (!asma->file) {
11980c2ac4ccfa Robert Love        2011-12-20  397  		char *name =3D ASHMEM_=
NAME_DEF;
11980c2ac4ccfa Robert Love        2011-12-20  398  		struct file *vmfile;
11980c2ac4ccfa Robert Love        2011-12-20  399  =

11980c2ac4ccfa Robert Love        2011-12-20  400  		if (asma->name[ASHMEM_=
NAME_PREFIX_LEN] !=3D '\0')
11980c2ac4ccfa Robert Love        2011-12-20  401  			name =3D asma->name;
11980c2ac4ccfa Robert Love        2011-12-20  402  =

11980c2ac4ccfa Robert Love        2011-12-20  403  		/* ... and allocate th=
e backing shmem file */
11980c2ac4ccfa Robert Love        2011-12-20  404  		vmfile =3D shmem_file_=
setup(name, asma->size, vma->vm_flags);
7f44cb0ba88b40 Viresh Kumar       2015-07-31  405  		if (IS_ERR(vmfile)) {
11980c2ac4ccfa Robert Love        2011-12-20  406  			ret =3D PTR_ERR(vmfil=
e);
11980c2ac4ccfa Robert Love        2011-12-20  407  			goto out;
11980c2ac4ccfa Robert Love        2011-12-20  408  		}
97fbfef6bd5978 Shuxiao Zhang      2017-04-06  409  		vmfile->f_mode |=3D FM=
ODE_LSEEK;
11980c2ac4ccfa Robert Love        2011-12-20  410  		asma->file =3D vmfile;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  411  		/*
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  412  		 * override mmap opera=
tion of the vmfile so that it can't be
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  413  		 * remapped which woul=
d lead to creation of a new vma with no
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  414  		 * asma permission che=
cks. Have to override get_unmapped_area
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  415  		 * as well to prevent =
VM_BUG_ON check for f_ops modification.
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  416  		 */
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  417  		if (!vmfile_fops.mmap)=
 {
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27 @418  			vmfile_fops =3D *vmfi=
le->f_op;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27 @419  			vmfile_fops.mmap =3D =
ashmem_vmfile_mmap;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27 @420  			vmfile_fops.get_unmap=
ped_area =3D
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  421  					ashmem_vmfile_get_u=
nmapped_area;
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  422  		}
6d67b0290b4b84 Suren Baghdasaryan 2020-01-27  423  		vmfile->f_op =3D &vmfi=
le_fops;
11980c2ac4ccfa Robert Love        2011-12-20  424  	}
11980c2ac4ccfa Robert Love        2011-12-20  425  	get_file(asma->file);
11980c2ac4ccfa Robert Love        2011-12-20  426  =

11980c2ac4ccfa Robert Love        2011-12-20  427  	/*
11980c2ac4ccfa Robert Love        2011-12-20  428  	 * XXX - Reworked to us=
e shmem_zero_setup() instead of
11980c2ac4ccfa Robert Love        2011-12-20  429  	 * shmem_set_file while=
 we're in staging. -jstultz
11980c2ac4ccfa Robert Love        2011-12-20  430  	 */
11980c2ac4ccfa Robert Love        2011-12-20  431  	if (vma->vm_flags & VM_=
SHARED) {
11980c2ac4ccfa Robert Love        2011-12-20  432  		ret =3D shmem_zero_set=
up(vma);
11980c2ac4ccfa Robert Love        2011-12-20  433  		if (ret) {
11980c2ac4ccfa Robert Love        2011-12-20  434  			fput(asma->file);
11980c2ac4ccfa Robert Love        2011-12-20  435  			goto out;
11980c2ac4ccfa Robert Love        2011-12-20  436  		}
44960f2a7b63e2 John Stultz        2018-07-31  437  	} else {
44960f2a7b63e2 John Stultz        2018-07-31  438  		vma_set_anonymous(vma);
11980c2ac4ccfa Robert Love        2011-12-20  439  	}
11980c2ac4ccfa Robert Love        2011-12-20  440  =

11980c2ac4ccfa Robert Love        2011-12-20  441  	if (vma->vm_file)
11980c2ac4ccfa Robert Love        2011-12-20  442  		fput(vma->vm_file);
11980c2ac4ccfa Robert Love        2011-12-20  443  	vma->vm_file =3D asma->=
file;
11980c2ac4ccfa Robert Love        2011-12-20  444  =

11980c2ac4ccfa Robert Love        2011-12-20  445  out:
11980c2ac4ccfa Robert Love        2011-12-20  446  	mutex_unlock(&ashmem_mu=
tex);
11980c2ac4ccfa Robert Love        2011-12-20  447  	return ret;
11980c2ac4ccfa Robert Love        2011-12-20  448  }
11980c2ac4ccfa Robert Love        2011-12-20  449  =


:::::: The code at line 418 was first introduced by commit
:::::: 6d67b0290b4b84c477e6a2fc6e005e174d3c7786 staging: android: ashmem: D=
isallow ashmem memory from being remapped

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8441997199174106319==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8441997199174106319==--

