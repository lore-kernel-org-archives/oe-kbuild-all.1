Content-Type: multipart/mixed; boundary="===============0637131095618343873=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [ti:ti-rt-linux-5.10.y 4405/5211] drivers/pci/endpoint/pci-epf-core.c:169 pci_epf_add_vepf() warn: inconsistent returns '&epf_pf->lock'.
Date: Tue, 25 May 2021 16:52:39 +0300
Message-ID: <202105252153.iX3RQPUD-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0637131095618343873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   9608f5b0459eb05d15bf5ac2945b0750d050fd57
commit: 0cf43e35b1743dc43574089fcf3ff71d8cd2ae39 [4405/5211] PCI: endpoint:=
 Add support to add virtual function in endpoint core
config: x86_64-randconfig-m001-20210525 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/endpoint/pci-epf-core.c:169 pci_epf_add_vepf() warn: inconsiste=
nt returns '&epf_pf->lock'.

vim +169 drivers/pci/endpoint/pci-epf-core.c

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  141  int pci_epf_add_vep=
f(struct pci_epf *epf_pf, struct pci_epf *epf_vf)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  142  {
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  143  	u32 vfunc_no;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  144  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  145  	if (IS_ERR_OR_NULL=
(epf_pf) || IS_ERR_OR_NULL(epf_vf))
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  146  		return -EINVAL;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  147  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  148  	if (epf_pf->epc ||=
 epf_vf->epc || epf_vf->epf_pf)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  149  		return -EBUSY;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  150  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  151  	if (epf_pf->sec_ep=
c || epf_vf->sec_epc)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  152  		return -EBUSY;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  153  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  154  	mutex_lock(&epf_pf=
->lock);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  155  	vfunc_no =3D find_=
first_zero_bit(&epf_pf->vfunction_num_map,
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  156  				       BITS_PER=
_LONG);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  157  	if (vfunc_no >=3D =
BITS_PER_LONG)
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  158  		return -EINVAL;

mutex_unlock(&epf_pf->lock); before returning.

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  159  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  160  	set_bit(vfunc_no, =
&epf_pf->vfunction_num_map);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  161  	epf_vf->vfunc_no =
=3D vfunc_no;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  162  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  163  	epf_vf->epf_pf =3D=
 epf_pf;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  164  	epf_vf->is_vf =3D =
true;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  165  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  166  	list_add_tail(&epf=
_vf->list, &epf_pf->pci_vepf);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  167  	mutex_unlock(&epf_=
pf->lock);
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  168  =

0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30 @169  	return 0;
0cf43e35b1743dc Kishon Vijay Abraham I 2021-03-30  170  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0637131095618343873==--

