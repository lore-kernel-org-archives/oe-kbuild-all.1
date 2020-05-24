Content-Type: multipart/mixed; boundary="===============5330581181674231552=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/misc/pci_endpoint_test.c:347:6: warning: Local variable 'irq_type' shadows outer variable [shadowVariable]
Date: Sun, 24 May 2020 13:28:30 +0800
Message-ID: <202005241325.ko7vAgMK%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5330581181674231552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   caffb99b6929f41a69edbb5aef3a359bf45f3315
commit: b2ba9225e0313b1de631a44b7b48c109032bffec misc: pci_endpoint_test: A=
void using module parameter to determine irqtype
date:   7 weeks ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        git checkout b2ba9225e0313b1de631a44b7b48c109032bffec
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/pci_endpoint_test.c:347:6: warning: Local variable 'irq_typ=
e' shadows outer variable [shadowVariable]
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:86:12: note: Shadowed declaration
   static int irq_type =3D IRQ_TYPE_MSI;
              ^
   drivers/misc/pci_endpoint_test.c:347:6: note: Shadow variable
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:481:6: warning: Local variable 'irq_typ=
e' shadows outer variable [shadowVariable]
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:86:12: note: Shadowed declaration
   static int irq_type =3D IRQ_TYPE_MSI;
              ^
   drivers/misc/pci_endpoint_test.c:481:6: note: Shadow variable
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:580:6: warning: Local variable 'irq_typ=
e' shadows outer variable [shadowVariable]
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:86:12: note: Shadowed declaration
   static int irq_type =3D IRQ_TYPE_MSI;
              ^
   drivers/misc/pci_endpoint_test.c:580:6: note: Shadow variable
    int irq_type =3D test->irq_type;
        ^

vim +/irq_type +347 drivers/misc/pci_endpoint_test.c

   326	=

   327	static bool pci_endpoint_test_copy(struct pci_endpoint_test *test,
   328					   unsigned long arg)
   329	{
   330		struct pci_endpoint_test_xfer_param param;
   331		bool ret =3D false;
   332		void *src_addr;
   333		void *dst_addr;
   334		u32 flags =3D 0;
   335		bool use_dma;
   336		size_t size;
   337		dma_addr_t src_phys_addr;
   338		dma_addr_t dst_phys_addr;
   339		struct pci_dev *pdev =3D test->pdev;
   340		struct device *dev =3D &pdev->dev;
   341		void *orig_src_addr;
   342		dma_addr_t orig_src_phys_addr;
   343		void *orig_dst_addr;
   344		dma_addr_t orig_dst_phys_addr;
   345		size_t offset;
   346		size_t alignment =3D test->alignment;
 > 347		int irq_type =3D test->irq_type;
   348		u32 src_crc32;
   349		u32 dst_crc32;
   350		int err;
   351	=

   352		err =3D copy_from_user(&param, (void __user *)arg, sizeof(param));
   353		if (err) {
   354			dev_err(dev, "Failed to get transfer param\n");
   355			return false;
   356		}
   357	=

   358		size =3D param.size;
   359		if (size > SIZE_MAX - alignment)
   360			goto err;
   361	=

   362		use_dma =3D !!(param.flags & PCITEST_FLAGS_USE_DMA);
   363		if (use_dma)
   364			flags |=3D FLAG_USE_DMA;
   365	=

   366		if (irq_type < IRQ_TYPE_LEGACY || irq_type > IRQ_TYPE_MSIX) {
   367			dev_err(dev, "Invalid IRQ type option\n");
   368			goto err;
   369		}
   370	=

   371		orig_src_addr =3D kzalloc(size + alignment, GFP_KERNEL);
   372		if (!orig_src_addr) {
   373			dev_err(dev, "Failed to allocate source buffer\n");
   374			ret =3D false;
   375			goto err;
   376		}
   377	=

   378		get_random_bytes(orig_src_addr, size + alignment);
   379		orig_src_phys_addr =3D dma_map_single(dev, orig_src_addr,
   380						    size + alignment, DMA_TO_DEVICE);
   381		if (dma_mapping_error(dev, orig_src_phys_addr)) {
   382			dev_err(dev, "failed to map source buffer address\n");
   383			ret =3D false;
   384			goto err_src_phys_addr;
   385		}
   386	=

   387		if (alignment && !IS_ALIGNED(orig_src_phys_addr, alignment)) {
   388			src_phys_addr =3D PTR_ALIGN(orig_src_phys_addr, alignment);
   389			offset =3D src_phys_addr - orig_src_phys_addr;
   390			src_addr =3D orig_src_addr + offset;
   391		} else {
   392			src_phys_addr =3D orig_src_phys_addr;
   393			src_addr =3D orig_src_addr;
   394		}
   395	=

   396		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_LOWER_SRC_ADDR,
   397					 lower_32_bits(src_phys_addr));
   398	=

   399		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_UPPER_SRC_ADDR,
   400					 upper_32_bits(src_phys_addr));
   401	=

   402		src_crc32 =3D crc32_le(~0, src_addr, size);
   403	=

   404		orig_dst_addr =3D kzalloc(size + alignment, GFP_KERNEL);
   405		if (!orig_dst_addr) {
   406			dev_err(dev, "Failed to allocate destination address\n");
   407			ret =3D false;
   408			goto err_dst_addr;
   409		}
   410	=

   411		orig_dst_phys_addr =3D dma_map_single(dev, orig_dst_addr,
   412						    size + alignment, DMA_FROM_DEVICE);
   413		if (dma_mapping_error(dev, orig_dst_phys_addr)) {
   414			dev_err(dev, "failed to map destination buffer address\n");
   415			ret =3D false;
   416			goto err_dst_phys_addr;
   417		}
   418	=

   419		if (alignment && !IS_ALIGNED(orig_dst_phys_addr, alignment)) {
   420			dst_phys_addr =3D PTR_ALIGN(orig_dst_phys_addr, alignment);
   421			offset =3D dst_phys_addr - orig_dst_phys_addr;
   422			dst_addr =3D orig_dst_addr + offset;
   423		} else {
   424			dst_phys_addr =3D orig_dst_phys_addr;
   425			dst_addr =3D orig_dst_addr;
   426		}
   427	=

   428		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_LOWER_DST_ADDR,
   429					 lower_32_bits(dst_phys_addr));
   430		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_UPPER_DST_ADDR,
   431					 upper_32_bits(dst_phys_addr));
   432	=

   433		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_SIZE,
   434					 size);
   435	=

   436		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_FLAGS, flags);
   437		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type=
);
   438		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
   439		pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
   440					 COMMAND_COPY);
   441	=

   442		wait_for_completion(&test->irq_raised);
   443	=

   444		dma_unmap_single(dev, orig_dst_phys_addr, size + alignment,
   445				 DMA_FROM_DEVICE);
   446	=

   447		dst_crc32 =3D crc32_le(~0, dst_addr, size);
   448		if (dst_crc32 =3D=3D src_crc32)
   449			ret =3D true;
   450	=

   451	err_dst_phys_addr:
   452		kfree(orig_dst_addr);
   453	=

   454	err_dst_addr:
   455		dma_unmap_single(dev, orig_src_phys_addr, size + alignment,
   456				 DMA_TO_DEVICE);
   457	=

   458	err_src_phys_addr:
   459		kfree(orig_src_addr);
   460	=

   461	err:
   462		return ret;
   463	}
   464	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5330581181674231552==--

